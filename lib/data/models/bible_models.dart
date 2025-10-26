import 'package:freezed_annotation/freezed_annotation.dart';

part 'bible_models.freezed.dart';
part 'bible_models.g.dart';

@freezed
class Bible with _$Bible {
  const factory Bible({
    required List<Testament> antigoTestamento,
    required List<Testament> novoTestamento,
  }) = _Bible;

  factory Bible.fromJson(Map<String, dynamic> json) => _$BibleFromJson(json);
}

@freezed
class Testament with _$Testament {
  const factory Testament({
    required String nome,
    required List<Chapter> capitulos,
  }) = _Testament;

  factory Testament.fromJson(Map<String, dynamic> json) => _$TestamentFromJson(json);
}

@freezed
class Chapter with _$Chapter {
  const factory Chapter({
    required int capitulo,
    required List<Verse> versiculos,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}

@freezed
class Verse with _$Verse {
  const factory Verse({
    required int versiculo,
    required String texto,
  }) = _Verse;

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);
}

@freezed
class BibleReference with _$BibleReference {
  const factory BibleReference({
    required String bookName,
    required int chapter,
    required int verse,
    String? text,
  }) = _BibleReference;

  factory BibleReference.fromJson(Map<String, dynamic> json) => _$BibleReferenceFromJson(json);
}

@freezed
class FavoriteVerse with _$FavoriteVerse {
  const factory FavoriteVerse({
    required String id,
    required String bookName,
    required int chapter,
    required int verse,
    required String text,
    required DateTime createdAt,
    String? note,
    HighlightColor? highlightColor,
  }) = _FavoriteVerse;

  factory FavoriteVerse.fromJson(Map<String, dynamic> json) => _$FavoriteVerseFromJson(json);
}

@freezed
class ReadingPlan with _$ReadingPlan {
  const factory ReadingPlan({
    required String id,
    required String name,
    required String description,
    required int durationDays,
    required List<ReadingDay> days,
    required DateTime createdAt,
    DateTime? completedAt,
    int? currentDay,
  }) = _ReadingPlan;

  factory ReadingPlan.fromJson(Map<String, dynamic> json) => _$ReadingPlanFromJson(json);
}

@freezed
class ReadingDay with _$ReadingDay {
  const factory ReadingDay({
    required int day,
    required String title,
    required List<BibleReference> readings,
    String? reflection,
    bool? completed,
  }) = _ReadingDay;

  factory ReadingDay.fromJson(Map<String, dynamic> json) => _$ReadingDayFromJson(json);
}

@freezed
class DailyReflection with _$DailyReflection {
  const factory DailyReflection({
    required String id,
    required String title,
    required String verse,
    required String text,
    required String reflection,
    required String bookName,
    required int chapter,
    required int verseNumber,
    required DateTime date,
  }) = _DailyReflection;

  factory DailyReflection.fromJson(Map<String, dynamic> json) => _$DailyReflectionFromJson(json);
}

enum HighlightColor {
  yellow,
  green,
  blue,
  red,
  purple,
  orange,
}

enum TestamentType {
  old,
  newTestament,
}
