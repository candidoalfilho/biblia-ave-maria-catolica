import 'package:equatable/equatable.dart';
import '../../data/models/bible_models.dart';

class BibleEntity extends Equatable {
  final List<TestamentEntity> oldTestament;
  final List<TestamentEntity> newTestament;

  const BibleEntity({
    required this.oldTestament,
    required this.newTestament,
  });

  @override
  List<Object?> get props => [oldTestament, newTestament];
}

class TestamentEntity extends Equatable {
  final String name;
  final List<ChapterEntity> chapters;

  const TestamentEntity({
    required this.name,
    required this.chapters,
  });

  @override
  List<Object?> get props => [name, chapters];
}

class ChapterEntity extends Equatable {
  final int chapterNumber;
  final List<VerseEntity> verses;

  const ChapterEntity({
    required this.chapterNumber,
    required this.verses,
  });

  @override
  List<Object?> get props => [chapterNumber, verses];
}

class VerseEntity extends Equatable {
  final int verseNumber;
  final String text;

  const VerseEntity({
    required this.verseNumber,
    required this.text,
  });

  @override
  List<Object?> get props => [verseNumber, text];
}

class BibleReferenceEntity extends Equatable {
  final String bookName;
  final int chapter;
  final int verse;
  final String? text;

  const BibleReferenceEntity({
    required this.bookName,
    required this.chapter,
    required this.verse,
    this.text,
  });

  @override
  List<Object?> get props => [bookName, chapter, verse, text];
}

class FavoriteVerseEntity extends Equatable {
  final String id;
  final String bookName;
  final int chapter;
  final int verse;
  final String text;
  final DateTime createdAt;
  final String? note;
  final HighlightColor? highlightColor;

  const FavoriteVerseEntity({
    required this.id,
    required this.bookName,
    required this.chapter,
    required this.verse,
    required this.text,
    required this.createdAt,
    this.note,
    this.highlightColor,
  });

  @override
  List<Object?> get props => [
        id,
        bookName,
        chapter,
        verse,
        text,
        createdAt,
        note,
        highlightColor,
      ];
}

class ReadingPlanEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final int durationDays;
  final List<ReadingDayEntity> days;
  final DateTime createdAt;
  final DateTime? completedAt;
  final int? currentDay;

  const ReadingPlanEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.durationDays,
    required this.days,
    required this.createdAt,
    this.completedAt,
    this.currentDay,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        durationDays,
        days,
        createdAt,
        completedAt,
        currentDay,
      ];
}

class ReadingDayEntity extends Equatable {
  final int day;
  final String title;
  final List<BibleReferenceEntity> readings;
  final String? reflection;
  final bool? completed;

  const ReadingDayEntity({
    required this.day,
    required this.title,
    required this.readings,
    this.reflection,
    this.completed,
  });

  @override
  List<Object?> get props => [day, title, readings, reflection, completed];
}

class DailyReflectionEntity extends Equatable {
  final String id;
  final String title;
  final String verse;
  final String text;
  final String reflection;
  final String bookName;
  final int chapter;
  final int verseNumber;
  final DateTime date;

  const DailyReflectionEntity({
    required this.id,
    required this.title,
    required this.verse,
    required this.text,
    required this.reflection,
    required this.bookName,
    required this.chapter,
    required this.verseNumber,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        verse,
        text,
        reflection,
        bookName,
        chapter,
        verseNumber,
        date,
      ];
}

enum TestamentType {
  old,
  newTestament,
}
