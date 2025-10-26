import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../models/bible_models.dart';
import '../../domain/entities/bible_entity.dart';
import '../../domain/entities/bible_entity.dart' as entities;

@injectable
class BibleRepository {
  Bible? _bible;

  Future<Bible> loadBible() async {
    if (_bible != null) return _bible!;

    try {
      final String jsonString = await rootBundle.loadString('assets/data/bibliaAveMaria.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      _bible = Bible.fromJson(jsonData);
      return _bible!;
    } catch (e) {
      throw Exception('Erro ao carregar a Bíblia: $e');
    }
  }

  Future<BibleEntity> getBibleEntity() async {
    final bible = await loadBible();
    return BibleEntity(
      oldTestament: bible.antigoTestamento
          .map((testament) => entities.TestamentEntity(
                name: testament.nome,
                chapters: testament.capitulos
                    .map((chapter) => entities.ChapterEntity(
                          chapterNumber: chapter.capitulo,
                          verses: chapter.versiculos
                              .map((verse) => entities.VerseEntity(
                                    verseNumber: verse.versiculo,
                                    text: verse.texto,
                                  ))
                              .toList(),
                        ))
                    .toList(),
              ))
          .toList(),
      newTestament: bible.novoTestamento
          .map((testament) => entities.TestamentEntity(
                name: testament.nome,
                chapters: testament.capitulos
                    .map((chapter) => entities.ChapterEntity(
                          chapterNumber: chapter.capitulo,
                          verses: chapter.versiculos
                              .map((verse) => entities.VerseEntity(
                                    verseNumber: verse.versiculo,
                                    text: verse.texto,
                                  ))
                              .toList(),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }

  Future<List<BibleReferenceEntity>> searchVerses(String query) async {
    final bible = await loadBible();
    final List<BibleReferenceEntity> results = [];

    // Search in Old Testament
    for (final testament in bible.antigoTestamento) {
      for (final chapter in testament.capitulos) {
        for (final verse in chapter.versiculos) {
          if (verse.texto.toLowerCase().contains(query.toLowerCase())) {
            results.add(BibleReferenceEntity(
              bookName: testament.nome,
              chapter: chapter.capitulo,
              verse: verse.versiculo,
              text: verse.texto,
            ));
          }
        }
      }
    }

    // Search in New Testament
    for (final testament in bible.novoTestamento) {
      for (final chapter in testament.capitulos) {
        for (final verse in chapter.versiculos) {
          if (verse.texto.toLowerCase().contains(query.toLowerCase())) {
            results.add(BibleReferenceEntity(
              bookName: testament.nome,
              chapter: chapter.capitulo,
              verse: verse.versiculo,
              text: verse.texto,
            ));
          }
        }
      }
    }

    return results;
  }

  Future<BibleReferenceEntity?> getVerse(String bookName, int chapter, int verse) async {
    final bible = await loadBible();

    // Search in Old Testament
    for (final testament in bible.antigoTestamento) {
      if (testament.nome == bookName) {
        for (final chapterData in testament.capitulos) {
          if (chapterData.capitulo == chapter) {
            for (final verseData in chapterData.versiculos) {
              if (verseData.versiculo == verse) {
                return BibleReferenceEntity(
                  bookName: testament.nome,
                  chapter: chapterData.capitulo,
                  verse: verseData.versiculo,
                  text: verseData.texto,
                );
              }
            }
          }
        }
      }
    }

    // Search in New Testament
    for (final testament in bible.novoTestamento) {
      if (testament.nome == bookName) {
        for (final chapterData in testament.capitulos) {
          if (chapterData.capitulo == chapter) {
            for (final verseData in chapterData.versiculos) {
              if (verseData.versiculo == verse) {
                return BibleReferenceEntity(
                  bookName: testament.nome,
                  chapter: chapterData.capitulo,
                  verse: verseData.versiculo,
                  text: verseData.texto,
                );
              }
            }
          }
        }
      }
    }

    return null;
  }

  Future<List<ChapterEntity>> getChapters(String bookName) async {
    final bible = await loadBible();

    // Search in Old Testament
    for (final testament in bible.antigoTestamento) {
      if (testament.nome == bookName) {
        return testament.capitulos
            .map((chapter) => entities.ChapterEntity(
                  chapterNumber: chapter.capitulo,
                  verses: chapter.versiculos
                      .map((verse) => entities.VerseEntity(
                            verseNumber: verse.versiculo,
                            text: verse.texto,
                          ))
                      .toList(),
                ))
            .toList();
      }
    }

    // Search in New Testament
    for (final testament in bible.novoTestamento) {
      if (testament.nome == bookName) {
        return testament.capitulos
            .map((chapter) => entities.ChapterEntity(
                  chapterNumber: chapter.capitulo,
                  verses: chapter.versiculos
                      .map((verse) => entities.VerseEntity(
                            verseNumber: verse.versiculo,
                            text: verse.texto,
                          ))
                      .toList(),
                ))
            .toList();
      }
    }

    return [];
  }

  Future<List<String>> getAllBookNames() async {
    final bible = await loadBible();
    final List<String> bookNames = [];

    // Add Old Testament books
    for (final testament in bible.antigoTestamento) {
      bookNames.add(testament.nome);
    }

    // Add New Testament books
    for (final testament in bible.novoTestamento) {
      bookNames.add(testament.nome);
    }

    return bookNames;
  }
}



