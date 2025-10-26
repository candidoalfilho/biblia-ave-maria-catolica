import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../models/bible_models.dart';
import '../../domain/entities/bible_entity.dart';

@injectable
class ReadingPlansRepository {
  static const String _boxName = 'reading_plans';
  late Box<ReadingPlan> _box;

  Future<void> init() async {
    _box = await Hive.openBox<ReadingPlan>(_boxName);
  }

  Future<List<ReadingPlanEntity>> getAllPlans() async {
    final plans = _box.values.toList();
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
    await _box.put(plan.id, planModel);
  }

  Future<void> updatePlan(ReadingPlanEntity plan) async {
    await addPlan(plan);
  }

  Future<void> deletePlan(String id) async {
    await _box.delete(id);
  }

  Future<ReadingPlanEntity?> getPlan(String id) async {
    final plan = _box.get(id);
    if (plan == null) return null;

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



