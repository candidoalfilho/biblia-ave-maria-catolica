import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../models/bible_models.dart';
import '../../domain/entities/bible_entity.dart';

@singleton
class ReadingPlansRepository {
  static const String _boxName = 'reading_plans';
  late Box<String> _box;

  Future<void> init() async {
    _box = await Hive.openBox<String>(_boxName);
  }

  Future<List<ReadingPlanEntity>> getAllPlans() async {
    if (_box.isEmpty) {
      await _seedPlans();
    }
    
    final plans = _box.values
        .map((jsonString) => ReadingPlan.fromJson(
              Map<String, dynamic>.from(
                  jsonDecode(jsonString) as Map),
            ))
        .toList();
    
    return plans
        .map((plan) => ReadingPlanEntity(
              id: plan.id,
              name: plan.name,
              description: plan.description,
              durationDays: plan.durationDays,
              days: plan.days
                  .map((day) => ReadingDayEntity(
                        day: day.day,
                        title: day.title,
                        readings: day.readings
                            .map((reading) => BibleReferenceEntity(
                                  bookName: reading.bookName,
                                  chapter: reading.chapter,
                                  verse: reading.verse,
                                  text: reading.text,
                                ))
                            .toList(),
                        reflection: day.reflection,
                        completed: day.completed,
                      ))
                  .toList(),
              createdAt: plan.createdAt,
              completedAt: plan.completedAt,
              currentDay: plan.currentDay,
            ))
        .toList();
  }

  Future<void> _seedPlans() async {
    final plans = [
      ReadingPlan(
        id: '1',
        name: 'Os Evangelhos em 90 Dias',
        description: 'Uma jornada profunda pela vida e ensinamentos de Jesus Cristo através dos quatro Evangelhos.',
        durationDays: 90,
        days: [], // Populate with actual days logic if needed
        createdAt: DateTime.now(),
        currentDay: 1,
      ),
      ReadingPlan(
        id: '2',
        name: 'Salmos de Sabedoria',
        description: 'Encontre paz e sabedoria divina lendo um Salmo por dia durante um mês.',
        durationDays: 30,
        days: [],
        createdAt: DateTime.now(),
        currentDay: 1,
      ),
      ReadingPlan(
        id: '3',
        name: 'Novo Testamento em 6 Meses',
        description: 'Leia todo o Novo Testamento em 6 meses com leituras diárias selecionadas.',
        durationDays: 180,
        days: [],
        createdAt: DateTime.now(),
        currentDay: 1,
      ),
    ];

    for (var plan in plans) {
      await _box.put(plan.id, jsonEncode(plan.toJson()));
    }
  }

  Future<void> addPlan(ReadingPlanEntity plan) async {
    final planModel = ReadingPlan(
      id: plan.id,
      name: plan.name,
      description: plan.description,
      durationDays: plan.durationDays,
      days: plan.days
          .map((day) => ReadingDay(
                day: day.day,
                title: day.title,
                readings: day.readings
                    .map((reading) => BibleReference(
                          bookName: reading.bookName,
                          chapter: reading.chapter,
                          verse: reading.verse,
                          text: reading.text,
                        ))
                    .toList(),
                reflection: day.reflection,
                completed: day.completed,
              ))
          .toList(),
      createdAt: plan.createdAt,
      completedAt: plan.completedAt,
      currentDay: plan.currentDay,
    );
    await _box.put(plan.id, jsonEncode(planModel.toJson()));
  }

  Future<void> updatePlan(ReadingPlanEntity plan) async {
    await addPlan(plan);
  }

  Future<void> deletePlan(String id) async {
    await _box.delete(id);
  }

  Future<ReadingPlanEntity?> getPlan(String id) async {
    final jsonString = _box.get(id);
    if (jsonString == null) return null;

    final plan = ReadingPlan.fromJson(
      Map<String, dynamic>.from(jsonDecode(jsonString) as Map),
    );

    return ReadingPlanEntity(
      id: plan.id,
      name: plan.name,
      description: plan.description,
      durationDays: plan.durationDays,
      days: plan.days
          .map((day) => ReadingDayEntity(
                day: day.day,
                title: day.title,
                readings: day.readings
                    .map((reading) => BibleReferenceEntity(
                          bookName: reading.bookName,
                          chapter: reading.chapter,
                          verse: reading.verse,
                          text: reading.text,
                        ))
                    .toList(),
                reflection: day.reflection,
                completed: day.completed,
              ))
          .toList(),
      createdAt: plan.createdAt,
      completedAt: plan.completedAt,
      currentDay: plan.currentDay,
    );
  }

  Future<void> markDayCompleted(String planId, int day) async {
    final plan = await getPlan(planId);
    if (plan == null) return;

    final updatedDays = plan.days.map((dayData) {
      if (dayData.day == day) {
        return ReadingDayEntity(
          day: dayData.day,
          title: dayData.title,
          readings: dayData.readings,
          reflection: dayData.reflection,
          completed: true,
        );
      }
      return dayData;
    }).toList();

    final updatedPlan = ReadingPlanEntity(
      id: plan.id,
      name: plan.name,
      description: plan.description,
      durationDays: plan.durationDays,
      days: updatedDays,
      createdAt: plan.createdAt,
      completedAt: plan.completedAt,
      currentDay: plan.currentDay,
    );

    await updatePlan(updatedPlan);
  }

  Future<void> setCurrentDay(String planId, int day) async {
    final plan = await getPlan(planId);
    if (plan == null) return;

    final updatedPlan = ReadingPlanEntity(
      id: plan.id,
      name: plan.name,
      description: plan.description,
      durationDays: plan.durationDays,
      days: plan.days,
      createdAt: plan.createdAt,
      completedAt: plan.completedAt,
      currentDay: day,
    );

    await updatePlan(updatedPlan);
  }

  Future<void> markPlanCompleted(String planId) async {
    final plan = await getPlan(planId);
    if (plan == null) return;

    final updatedPlan = ReadingPlanEntity(
      id: plan.id,
      name: plan.name,
      description: plan.description,
      durationDays: plan.durationDays,
      days: plan.days,
      createdAt: plan.createdAt,
      completedAt: DateTime.now(),
      currentDay: plan.currentDay,
    );

    await updatePlan(updatedPlan);
  }
}



