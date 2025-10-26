// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BibleImpl _$$BibleImplFromJson(Map<String, dynamic> json) => _$BibleImpl(
      antigoTestamento: (json['antigoTestamento'] as List<dynamic>)
          .map((e) => Testament.fromJson(e as Map<String, dynamic>))
          .toList(),
      novoTestamento: (json['novoTestamento'] as List<dynamic>)
          .map((e) => Testament.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BibleImplToJson(_$BibleImpl instance) =>
    <String, dynamic>{
      'antigoTestamento': instance.antigoTestamento,
      'novoTestamento': instance.novoTestamento,
    };

_$TestamentImpl _$$TestamentImplFromJson(Map<String, dynamic> json) =>
    _$TestamentImpl(
      nome: json['nome'] as String,
      capitulos: (json['capitulos'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TestamentImplToJson(_$TestamentImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'capitulos': instance.capitulos,
    };

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      capitulo: (json['capitulo'] as num).toInt(),
      versiculos: (json['versiculos'] as List<dynamic>)
          .map((e) => Verse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      'capitulo': instance.capitulo,
      'versiculos': instance.versiculos,
    };

_$VerseImpl _$$VerseImplFromJson(Map<String, dynamic> json) => _$VerseImpl(
      versiculo: (json['versiculo'] as num).toInt(),
      texto: json['texto'] as String,
    );

Map<String, dynamic> _$$VerseImplToJson(_$VerseImpl instance) =>
    <String, dynamic>{
      'versiculo': instance.versiculo,
      'texto': instance.texto,
    };

_$BibleReferenceImpl _$$BibleReferenceImplFromJson(Map<String, dynamic> json) =>
    _$BibleReferenceImpl(
      bookName: json['bookName'] as String,
      chapter: (json['chapter'] as num).toInt(),
      verse: (json['verse'] as num).toInt(),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$BibleReferenceImplToJson(
        _$BibleReferenceImpl instance) =>
    <String, dynamic>{
      'bookName': instance.bookName,
      'chapter': instance.chapter,
      'verse': instance.verse,
      'text': instance.text,
    };

_$FavoriteVerseImpl _$$FavoriteVerseImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteVerseImpl(
      id: json['id'] as String,
      bookName: json['bookName'] as String,
      chapter: (json['chapter'] as num).toInt(),
      verse: (json['verse'] as num).toInt(),
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      note: json['note'] as String?,
      highlightColor:
          $enumDecodeNullable(_$HighlightColorEnumMap, json['highlightColor']),
    );

Map<String, dynamic> _$$FavoriteVerseImplToJson(_$FavoriteVerseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookName': instance.bookName,
      'chapter': instance.chapter,
      'verse': instance.verse,
      'text': instance.text,
      'createdAt': instance.createdAt.toIso8601String(),
      'note': instance.note,
      'highlightColor': _$HighlightColorEnumMap[instance.highlightColor],
    };

const _$HighlightColorEnumMap = {
  HighlightColor.yellow: 'yellow',
  HighlightColor.green: 'green',
  HighlightColor.blue: 'blue',
  HighlightColor.red: 'red',
  HighlightColor.purple: 'purple',
  HighlightColor.orange: 'orange',
};

_$ReadingPlanImpl _$$ReadingPlanImplFromJson(Map<String, dynamic> json) =>
    _$ReadingPlanImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      durationDays: (json['durationDays'] as num).toInt(),
      days: (json['days'] as List<dynamic>)
          .map((e) => ReadingDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      currentDay: (json['currentDay'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReadingPlanImplToJson(_$ReadingPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'durationDays': instance.durationDays,
      'days': instance.days,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'currentDay': instance.currentDay,
    };

_$ReadingDayImpl _$$ReadingDayImplFromJson(Map<String, dynamic> json) =>
    _$ReadingDayImpl(
      day: (json['day'] as num).toInt(),
      title: json['title'] as String,
      readings: (json['readings'] as List<dynamic>)
          .map((e) => BibleReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      reflection: json['reflection'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$$ReadingDayImplToJson(_$ReadingDayImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'title': instance.title,
      'readings': instance.readings,
      'reflection': instance.reflection,
      'completed': instance.completed,
    };

_$DailyReflectionImpl _$$DailyReflectionImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyReflectionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      verse: json['verse'] as String,
      text: json['text'] as String,
      reflection: json['reflection'] as String,
      bookName: json['bookName'] as String,
      chapter: (json['chapter'] as num).toInt(),
      verseNumber: (json['verseNumber'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$DailyReflectionImplToJson(
        _$DailyReflectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'verse': instance.verse,
      'text': instance.text,
      'reflection': instance.reflection,
      'bookName': instance.bookName,
      'chapter': instance.chapter,
      'verseNumber': instance.verseNumber,
      'date': instance.date.toIso8601String(),
    };
