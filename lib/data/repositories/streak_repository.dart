import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StreakRepository {
  static const String _boxName = 'streak_box';
  static const String _streakKey = 'current_streak';
  static const String _lastReadDateKey = 'last_read_date';

  Future<Box> _getBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox(_boxName);
    }
    return Hive.box(_boxName);
  }

  Future<int> getCurrentStreak() async {
    final box = await _getBox();
    return box.get(_streakKey, defaultValue: 0);
  }

  Future<DateTime?> getLastReadDate() async {
    final box = await _getBox();
    final dateStr = box.get(_lastReadDateKey);
    if (dateStr != null) {
      return DateTime.parse(dateStr);
    }
    return null;
  }

  Future<void> updateStreak() async {
    final box = await _getBox();
    final lastReadDate = await getLastReadDate();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (lastReadDate == null) {
      // First time reading
      await box.put(_streakKey, 1);
      await box.put(_lastReadDateKey, today.toIso8601String());
    } else {
      final lastReadDay = DateTime(lastReadDate.year, lastReadDate.month, lastReadDate.day);
      
      if (today.difference(lastReadDay).inDays == 1) {
        // Consecutive day
        final currentStreak = await getCurrentStreak();
        await box.put(_streakKey, currentStreak + 1);
        await box.put(_lastReadDateKey, today.toIso8601String());
      } else if (today.difference(lastReadDay).inDays > 1) {
        // Streak broken
        await box.put(_streakKey, 1);
        await box.put(_lastReadDateKey, today.toIso8601String());
      }
      // If same day, do nothing
    }
  }
}
