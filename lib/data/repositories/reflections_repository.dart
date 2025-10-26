import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../models/bible_models.dart';
import '../../domain/entities/bible_entity.dart';

@injectable
class ReflectionsRepository {
  static const String _boxName = 'daily_reflections';
  late Box<DailyReflection> _box;

  Future<void> init() async {
    _box = await Hive.openBox<DailyReflection>(_boxName);
  }

  Future<List<DailyReflectionEntity>> getAllReflections() async {
    final reflections = _box.values.toList();
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
    await _box.put(reflection.id, reflectionModel);
  }

  Future<DailyReflectionEntity?> getReflection(String id) async {
    final reflection = _box.get(id);
    if (reflection == null) return null;

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
    final reflections = _box.values.toList();
    final reflection = reflections.firstWhere(
      (reflection) => 
          reflection.date.year == date.year &&
          reflection.date.month == date.month &&
          reflection.date.day == date.day,
      orElse: () => throw StateError('Reflection not found'),
    );

    if (reflection == null) return null;

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



