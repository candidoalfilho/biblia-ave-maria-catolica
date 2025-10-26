import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import '../../core/constants/app_constants.dart';

@injectable
class SettingsRepository {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Theme Settings
  Future<String> getThemeMode() async {
    return _prefs.getString('theme_mode') ?? AppConstants.systemThemeKey;
  }

  Future<void> setThemeMode(String themeMode) async {
    await _prefs.setString('theme_mode', themeMode);
  }

  // Font Size Settings
  Future<double> getFontSize() async {
    return _prefs.getDouble('font_size') ?? 16.0;
  }

  Future<void> setFontSize(double fontSize) async {
    await _prefs.setDouble('font_size', fontSize);
  }

  // Font Family Settings
  Future<String> getFontFamily() async {
    return _prefs.getString('font_family') ?? AppConstants.primaryFont;
  }

  Future<void> setFontFamily(String fontFamily) async {
    await _prefs.setString('font_family', fontFamily);
  }

  // TTS Settings
  Future<double> getSpeechRate() async {
    return _prefs.getDouble('speech_rate') ?? AppConstants.defaultSpeechRate;
  }

  Future<void> setSpeechRate(double rate) async {
    await _prefs.setDouble('speech_rate', rate);
  }

  Future<String> getTtsLanguage() async {
    return _prefs.getString('tts_language') ?? 'pt-BR';
  }

  Future<void> setTtsLanguage(String language) async {
    await _prefs.setString('tts_language', language);
  }

  // Premium Settings
  Future<bool> isPremium() async {
    return _prefs.getBool('is_premium') ?? false;
  }

  Future<void> setPremium(bool isPremium) async {
    await _prefs.setBool('is_premium', isPremium);
  }

  // First Launch
  Future<bool> isFirstLaunch() async {
    return _prefs.getBool('is_first_launch') ?? true;
  }

  Future<void> setFirstLaunch(bool isFirstLaunch) async {
    await _prefs.setBool('is_first_launch', isFirstLaunch);
  }

  // Last Read Position
  Future<String?> getLastReadPosition() async {
    return _prefs.getString('last_read_position');
  }

  Future<void> setLastReadPosition(String position) async {
    await _prefs.setString('last_read_position', position);
  }

  // Reading Progress
  Future<Map<String, dynamic>?> getReadingProgress() async {
    final progressJson = _prefs.getString('reading_progress');
    if (progressJson == null) return null;
    
    // You might want to use json.decode here if you store complex data
    return {'progress': progressJson};
  }

  Future<void> setReadingProgress(Map<String, dynamic> progress) async {
    // You might want to use json.encode here if you store complex data
    await _prefs.setString('reading_progress', progress.toString());
  }

  // Notifications
  Future<bool> getNotificationsEnabled() async {
    return _prefs.getBool('notifications_enabled') ?? true;
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    await _prefs.setBool('notifications_enabled', enabled);
  }

  Future<String> getNotificationTime() async {
    return _prefs.getString('notification_time') ?? '08:00';
  }

  Future<void> setNotificationTime(String time) async {
    await _prefs.setString('notification_time', time);
  }

  // Clear all settings
  Future<void> clearAllSettings() async {
    await _prefs.clear();
  }
}



