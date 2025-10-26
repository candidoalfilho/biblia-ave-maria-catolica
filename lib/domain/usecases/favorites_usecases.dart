import 'package:injectable/injectable.dart';
import '../../data/repositories/favorites_repository.dart';
import '../entities/bible_entity.dart';

@injectable
class GetAllFavoritesUseCase {
  final FavoritesRepository _repository;

  GetAllFavoritesUseCase(this._repository);

  Future<List<FavoriteVerseEntity>> call() async {
    return await _repository.getAllFavorites();
  }
}

@injectable
class AddFavoriteUseCase {
  final FavoritesRepository _repository;

  AddFavoriteUseCase(this._repository);

  Future<void> call(FavoriteVerseEntity favorite) async {
    await _repository.addFavorite(favorite);
  }
}

@injectable
class RemoveFavoriteUseCase {
  final FavoritesRepository _repository;

  RemoveFavoriteUseCase(this._repository);

  Future<void> call(String id) async {
    await _repository.removeFavorite(id);
  }
}

@injectable
class IsFavoriteUseCase {
  final FavoritesRepository _repository;

  IsFavoriteUseCase(this._repository);

  Future<bool> call(String bookName, int chapter, int verse) async {
    return await _repository.isFavorite(bookName, chapter, verse);
  }
}

@injectable
class GetFavoriteUseCase {
  final FavoritesRepository _repository;

  GetFavoriteUseCase(this._repository);

  Future<FavoriteVerseEntity?> call(String bookName, int chapter, int verse) async {
    return await _repository.getFavorite(bookName, chapter, verse);
  }
}

@injectable
class UpdateFavoriteUseCase {
  final FavoritesRepository _repository;

  UpdateFavoriteUseCase(this._repository);

  Future<void> call(FavoriteVerseEntity favorite) async {
    await _repository.updateFavorite(favorite);
  }
}

@injectable
class ClearAllFavoritesUseCase {
  final FavoritesRepository _repository;

  ClearAllFavoritesUseCase(this._repository);

  Future<void> call() async {
    await _repository.clearAllFavorites();
  }
}



