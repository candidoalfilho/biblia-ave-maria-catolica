class AppConstants {
  // App Info
  static const String appName = 'Bíblia Ave Maria Católica';
  static const String appVersion = '1.0.0';
  
  // Storage Keys
  static const String bibleDataKey = 'bible_data';
  static const String favoritesKey = 'favorites';
  static const String readingPlansKey = 'reading_plans';
  static const String dailyReflectionsKey = 'daily_reflections';
  static const String settingsKey = 'settings';
  static const String premiumKey = 'premium_status';
  
  // Theme
  static const String lightThemeKey = 'light_theme';
  static const String darkThemeKey = 'dark_theme';
  static const String systemThemeKey = 'system_theme';
  
  // Fonts
  static const String primaryFont = 'Merriweather';
  static const String secondaryFont = 'NotoSerif';
  
  // Colors
  static const int primaryColorValue = 0xFF8B4513; // Saddle Brown
  static const int secondaryColorValue = 0xFFD2B48C; // Tan
  static const int accentColorValue = 0xFFCD853F; // Peru
  static const int backgroundColorValue = 0xFFF5F5DC; // Beige
  static const int darkBackgroundColorValue = 0xFF2C2C2C; // Dark Gray
  
  // AdMob IDs (Test IDs - replace with real ones in production)
  static const String bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static const String interstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
  
  // In-App Purchase
  static const String premiumProductId = 'removeranuncios';
  static const double premiumPrice = 5.0;
  
  // Reading Plans
  static const List<String> predefinedPlans = [
    'Caminho da Fé',
    'Evangelhos em 15 dias',
    'Sabedoria e Paz',
  ];
  
  // TTS Settings
  static const double defaultSpeechRate = 0.5;
  static const double minSpeechRate = 0.1;
  static const double maxSpeechRate = 1.0;
  
  // Search
  static const int maxSearchResults = 100;
  static const int minSearchLength = 2;
  
  // UI
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double cardElevation = 2.0;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
}



