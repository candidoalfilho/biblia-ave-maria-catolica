import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
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