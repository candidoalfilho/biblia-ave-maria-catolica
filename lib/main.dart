import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'presentation/templates/main_template.dart';
import 'bloc/theme_bloc/theme_bloc.dart';
import 'bloc/bible_bloc/bible_bloc.dart';
import 'bloc/favorites_bloc/favorites_bloc.dart';
import 'bloc/tts_bloc/tts_bloc.dart';
import 'data/repositories/settings_repository.dart';
import 'domain/usecases/bible_usecases.dart';
import 'domain/usecases/favorites_usecases.dart';
import 'bloc/reading_plan_bloc/reading_plan_bloc.dart';
import 'bloc/streak_bloc/streak_bloc.dart';
import 'bloc/daily_reflection_bloc/daily_reflection_bloc.dart';
import 'data/repositories/reading_plans_repository.dart';
import 'data/repositories/streak_repository.dart';
import 'data/repositories/reflections_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Google Mobile Ads
  await MobileAds.instance.initialize();
  
  // Initialize dependencies
  await configureDependencies();
  
  runApp(const BibleApp());
}

class BibleApp extends StatelessWidget {
  const BibleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            settingsRepository: getIt<SettingsRepository>(),
          )..add(const LoadTheme()),
        ),
        BlocProvider<BibleBloc>(
          create: (context) => BibleBloc(
            getBibleUseCase: getIt<GetBibleUseCase>(),
            searchVersesUseCase: getIt<SearchVersesUseCase>(),
            getVerseUseCase: getIt<GetVerseUseCase>(),
            getChaptersUseCase: getIt<GetChaptersUseCase>(),
            getAllBookNamesUseCase: getIt<GetAllBookNamesUseCase>(),
          ),
        ),
        BlocProvider<FavoritesBloc>(
          create: (context) => FavoritesBloc(
            getAllFavoritesUseCase: getIt<GetAllFavoritesUseCase>(),
            addFavoriteUseCase: getIt<AddFavoriteUseCase>(),
            removeFavoriteUseCase: getIt<RemoveFavoriteUseCase>(),
            isFavoriteUseCase: getIt<IsFavoriteUseCase>(),
            getFavoriteUseCase: getIt<GetFavoriteUseCase>(),
            updateFavoriteUseCase: getIt<UpdateFavoriteUseCase>(),
            clearAllFavoritesUseCase: getIt<ClearAllFavoritesUseCase>(),
          ),
        ),
        BlocProvider<TtsBloc>(
          create: (context) => TtsBloc(
            settingsRepository: getIt<SettingsRepository>(),
          )..add(const InitializeTts()),
        ),
        BlocProvider<ReadingPlanBloc>(
          create: (context) => ReadingPlanBloc(
            repository: getIt<ReadingPlansRepository>(),
          )..add(const LoadReadingPlans()),
        ),
        BlocProvider<StreakBloc>(
          create: (context) => StreakBloc(
            streakRepository: getIt<StreakRepository>(),
          )..add(const LoadStreak()),
        ),
        BlocProvider<DailyReflectionBloc>(
          create: (context) => DailyReflectionBloc(
            repository: getIt<ReflectionsRepository>(),
          )..add(const LoadDailyReflection()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          ThemeData theme;
          if (themeState is ThemeLoaded) {
            switch (themeState.themeMode) {
              case 'light':
                theme = AppTheme.lightTheme;
                break;
              case 'dark':
                theme = AppTheme.darkTheme;
                break;
              default:
                theme = AppTheme.lightTheme;
                break;
            }
          } else {
            theme = AppTheme.lightTheme;
          }

          return MaterialApp(
            title: 'Bíblia Ave Maria Católica',
            theme: theme,
            home: const MainTemplate(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}