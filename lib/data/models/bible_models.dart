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

// Model for Liturgy API response
@freezed
class LiturgyResponse with _$LiturgyResponse {
  const factory LiturgyResponse({
    required String data,
    required String liturgia,
    required String cor,
    required String dia,
    required String ofertas,
    required String comunhao,
    required LiturgyReading primeiraLeitura,
    LiturgyReading? segundaLeitura,
    required LiturgySalmo salmo,
    required LiturgyReading evangelho,
    required LiturgyAntifonas antifonas,
  }) = _LiturgyResponse;

  factory LiturgyResponse.fromJson(Map<String, dynamic> json) {
    return LiturgyResponse(
      data: json['data'] ?? '',
      liturgia: json['liturgia'] as String,
      cor: json['cor'] as String,
      dia: json['dia'] ?? '',
      ofertas: json['ofertas'] ?? '',
      comunhao: json['comunhao'] ?? '',
      primeiraLeitura: LiturgyReading.fromJson(json['primeiraLeitura'] as Map<String, dynamic>),
      segundaLeitura: _segundaLeituraFromJson(json['segundaLeitura']),
      salmo: LiturgySalmo.fromJson(json['salmo'] as Map<String, dynamic>),
      evangelho: LiturgyReading.fromJson(json['evangelho'] as Map<String, dynamic>),
      antifonas: LiturgyAntifonas.fromJson(json['antifonas'] as Map<String, dynamic>),
    );
  }
}

LiturgyReading? _segundaLeituraFromJson(dynamic json) {
  if (json == null) return null;
  if (json is String) return null; // "Não há segunda leitura hoje!"
  if (json is Map<String, dynamic>) {
    return LiturgyReading.fromJson(json);
  }
  return null;
}

@freezed
class LiturgyReading with _$LiturgyReading {
  const factory LiturgyReading({
    required String referencia,
    required String titulo,
    required String texto,
  }) = _LiturgyReading;

  factory LiturgyReading.fromJson(Map<String, dynamic> json) => _$LiturgyReadingFromJson(json);
}

@freezed
class LiturgySalmo with _$LiturgySalmo {
  const factory LiturgySalmo({
    required String referencia,
    required String refrao,
    required String texto,
  }) = _LiturgySalmo;

  factory LiturgySalmo.fromJson(Map<String, dynamic> json) => _$LiturgySalmoFromJson(json);
}

@freezed
class LiturgyAntifonas with _$LiturgyAntifonas {
  const factory LiturgyAntifonas({
    required String entrada,
    required String comunhao,
  }) = _LiturgyAntifonas;

  factory LiturgyAntifonas.fromJson(Map<String, dynamic> json) => _$LiturgyAntifonasFromJson(json);
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
