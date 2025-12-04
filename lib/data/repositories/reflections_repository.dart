import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import '../models/bible_models.dart';
import '../../domain/entities/bible_entity.dart';

@singleton
class ReflectionsRepository {
  static const String _boxName = 'daily_reflections';
  late Box<String> _box;

  Future<void> init() async {
    _box = await Hive.openBox<String>(_boxName);
  }

  Future<List<DailyReflectionEntity>> getAllReflections() async {
    final reflections = _box.values
        .map((jsonString) => DailyReflection.fromJson(
              Map<String, dynamic>.from(jsonDecode(jsonString) as Map),
            ))
        .toList();
    
    return reflections
        .map((reflection) => DailyReflectionEntity(
              id: reflection.id,
              title: reflection.title,
              verse: reflection.verse,
              text: reflection.text,
              reflection: reflection.reflection,
              bookName: reflection.bookName,
              chapter: reflection.chapter,
              verseNumber: reflection.verseNumber,
              date: reflection.date,
            ))
        .toList();
  }

  Future<void> addReflection(DailyReflectionEntity reflection) async {
    final reflectionModel = DailyReflection(
      id: reflection.id,
      title: reflection.title,
      verse: reflection.verse,
      text: reflection.text,
      reflection: reflection.reflection,
      bookName: reflection.bookName,
      chapter: reflection.chapter,
      verseNumber: reflection.verseNumber,
      date: reflection.date,
    );
    await _box.put(reflection.id, jsonEncode(reflectionModel.toJson()));
  }

  Future<DailyReflectionEntity?> getReflection(String id) async {
    final jsonString = _box.get(id);
    if (jsonString == null) return null;

    final reflection = DailyReflection.fromJson(
      Map<String, dynamic>.from(jsonDecode(jsonString) as Map),
    );

    return DailyReflectionEntity(
      id: reflection.id,
      title: reflection.title,
      verse: reflection.verse,
      text: reflection.text,
      reflection: reflection.reflection,
      bookName: reflection.bookName,
      chapter: reflection.chapter,
      verseNumber: reflection.verseNumber,
      date: reflection.date,
    );
  }

  Future<DailyReflectionEntity?> getReflectionByDate(DateTime date) async {
    try {
      // Try to fetch from API first
      final liturgy = await _fetchLiturgyFromAPI();
      if (liturgy != null) {
        // Convert liturgy salmo to DailyReflectionEntity
        return _convertLiturgyToReflection(liturgy, date);
      }
    } catch (e) {
      print('Error fetching liturgy from API: $e');
      // Fallback to local storage if API fails
    }

    // Fallback to local storage
    if (_box.isEmpty) {
      await _seedReflections();
    }

    final reflections = _box.values
        .map((jsonString) => DailyReflection.fromJson(
              Map<String, dynamic>.from(jsonDecode(jsonString) as Map),
            ))
        .toList();
    
    try {
      final reflectionModel = reflections.firstWhere(
        (reflection) => 
            reflection.date.year == date.year &&
            reflection.date.month == date.month &&
            reflection.date.day == date.day,
      );
      
      return DailyReflectionEntity(
        id: reflectionModel.id,
        title: reflectionModel.title,
        verse: reflectionModel.verse,
        text: reflectionModel.text,
        reflection: reflectionModel.reflection,
        bookName: reflectionModel.bookName,
        chapter: reflectionModel.chapter,
        verseNumber: reflectionModel.verseNumber,
        date: reflectionModel.date,
      );
    } catch (e) {
      // Fallback to a random reflection if none exists for today
      if (reflections.isNotEmpty) {
        return DailyReflectionEntity(
          id: reflections.first.id,
          title: reflections.first.title,
          verse: reflections.first.verse,
          text: reflections.first.text,
          reflection: reflections.first.reflection,
          bookName: reflections.first.bookName,
          chapter: reflections.first.chapter,
          verseNumber: reflections.first.verseNumber,
          date: date, // Use today's date for the fallback
        );
      }
      return null;
    }
  }

  Future<LiturgyResponse?> _fetchLiturgyFromAPI() async {
    try {
      final response = await http.get(
        Uri.parse('https://liturgia.up.railway.app/'),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return LiturgyResponse.fromJson(jsonData);
      }
      return null;
    } catch (e) {
      print('Error fetching liturgy: $e');
      return null;
    }
  }

  DailyReflectionEntity _convertLiturgyToReflection(LiturgyResponse liturgy, DateTime date) {
    // Extract salmo number from referencia (e.g., "Sl 33" -> 33)
    final salmoMatch = RegExp(r'Sl\s*(\d+)').firstMatch(liturgy.salmo.referencia);
    final salmoNumber = salmoMatch != null ? int.tryParse(salmoMatch.group(1) ?? '1') ?? 1 : 1;

    // Create a reflection from the salmo
    return DailyReflectionEntity(
      id: 'liturgy_${date.millisecondsSinceEpoch}',
      title: 'Salmo ${salmoNumber}',
      verse: liturgy.salmo.referencia,
      text: liturgy.salmo.texto,
      reflection: '${liturgy.salmo.refrao}\n\n${liturgy.dia}',
      bookName: 'Salmos',
      chapter: salmoNumber,
      verseNumber: 1,
      date: date,
    );
  }

  Future<void> _seedReflections() async {
    final now = DateTime.now();
    final initialReflections = [
      DailyReflection(
        id: '1',
        title: 'O Amor de Deus',
        verse: 'João 3:16',
        text: 'Com efeito, de tal modo Deus amou o mundo, que lhe deu seu Filho único, para que todo o que nele crer não pereça, mas tenha a vida eterna.',
        reflection: 'O amor de Deus é incondicional e infinito. Ele nos entregou seu bem mais precioso para nos salvar. Hoje, reflita sobre como você tem respondido a esse amor imenso em sua vida diária.',
        bookName: 'João',
        chapter: 3,
        verseNumber: 16,
        date: now,
      ),
      DailyReflection(
        id: '2',
        title: 'A Força da Fé',
        verse: 'Hebreus 11:1',
        text: 'A fé é o fundamento da esperança, é uma certeza a respeito do que não se vê.',
        reflection: 'Mesmo quando não vemos a solução, a fé nos sustenta. Ela é a certeza de que Deus está agindo em nosso favor. Mantenha sua fé firme, pois ela é a chave para o impossível.',
        bookName: 'Hebreus',
        chapter: 11,
        verseNumber: 1,
        date: now.add(const Duration(days: 1)),
      ),
    ];

    for (var reflection in initialReflections) {
      await _box.put(reflection.id, jsonEncode(reflection.toJson()));
    }
  }

  Future<void> updateReflection(DailyReflectionEntity reflection) async {
    await addReflection(reflection);
  }

  Future<void> deleteReflection(String id) async {
    await _box.delete(id);
  }

  Future<void> clearAllReflections() async {
    await _box.clear();
  }
}



