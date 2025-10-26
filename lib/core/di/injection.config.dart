// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:biblia_ave_maria_catolica/data/repositories/bible_repository.dart'
    as _i119;
import 'package:biblia_ave_maria_catolica/data/repositories/favorites_repository.dart'
    as _i311;
import 'package:biblia_ave_maria_catolica/data/repositories/reading_plans_repository.dart'
    as _i511;
import 'package:biblia_ave_maria_catolica/data/repositories/reflections_repository.dart'
    as _i816;
import 'package:biblia_ave_maria_catolica/data/repositories/settings_repository.dart'
    as _i436;
import 'package:biblia_ave_maria_catolica/domain/usecases/bible_usecases.dart'
    as _i504;
import 'package:biblia_ave_maria_catolica/domain/usecases/favorites_usecases.dart'
    as _i475;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i311.FavoritesRepository>(() => _i311.FavoritesRepository());
    gh.factory<_i511.ReadingPlansRepository>(
        () => _i511.ReadingPlansRepository());
    gh.factory<_i816.ReflectionsRepository>(
        () => _i816.ReflectionsRepository());
    gh.factory<_i436.SettingsRepository>(() => _i436.SettingsRepository());
    gh.factory<_i119.BibleRepository>(() => _i119.BibleRepository());
    gh.factory<_i504.GetBibleUseCase>(
        () => _i504.GetBibleUseCase(gh<_i119.BibleRepository>()));
    gh.factory<_i504.SearchVersesUseCase>(
        () => _i504.SearchVersesUseCase(gh<_i119.BibleRepository>()));
    gh.factory<_i504.GetVerseUseCase>(
        () => _i504.GetVerseUseCase(gh<_i119.BibleRepository>()));
    gh.factory<_i504.GetChaptersUseCase>(
        () => _i504.GetChaptersUseCase(gh<_i119.BibleRepository>()));
    gh.factory<_i504.GetAllBookNamesUseCase>(
        () => _i504.GetAllBookNamesUseCase(gh<_i119.BibleRepository>()));
    gh.factory<_i475.GetAllFavoritesUseCase>(
        () => _i475.GetAllFavoritesUseCase(gh<_i311.FavoritesRepository>()));
    gh.factory<_i475.AddFavoriteUseCase>(
        () => _i475.AddFavoriteUseCase(gh<_i311.FavoritesRepository>()));
    gh.factory<_i475.RemoveFavoriteUseCase>(
        () => _i475.RemoveFavoriteUseCase(gh<_i311.FavoritesRepository>()));
    gh.factory<_i475.IsFavoriteUseCase>(
        () => _i475.IsFavoriteUseCase(gh<_i311.FavoritesRepository>()));
    gh.factory<_i475.GetFavoriteUseCase>(
        () => _i475.GetFavoriteUseCase(gh<_i311.FavoritesRepository>()));
    gh.factory<_i475.UpdateFavoriteUseCase>(
        () => _i475.UpdateFavoriteUseCase(gh<_i311.FavoritesRepository>()));
    gh.factory<_i475.ClearAllFavoritesUseCase>(
        () => _i475.ClearAllFavoritesUseCase(gh<_i311.FavoritesRepository>()));
    return this;
  }
}
