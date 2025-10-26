import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../models/bible_models.dart';
import '../../domain/entities/bible_entity.dart';

@injectable
class FavoritesRepository {
  static const String _boxName = 'favorites';
  late Box<FavoriteVerse> _box;

  Future<void> init() async {
    _box = await Hive.openBox<FavoriteVerse>(_boxName);
  }

  Future<List<FavoriteVerseEntity>> getAllFavorites() async {
    final favorites = _box.values.toList();
    return favorites
        .map((favorite) => FavoriteVerseEntity(
              id: favorite.id,
              bookName: favorite.bookName,
              chapter: favorite.chapter,
              verse: favorite.verse,
              text: favorite.text,
              createdAt: favorite.createdAt,
              note: favorite.note,
              highlightColor: _convertHighlightColor(favorite.highlightColor),
            ))
        .toList();
  }

  Future<void> addFavorite(FavoriteVerseEntity favorite) async {
    final favoriteModel = FavoriteVerse(
      id: favorite.id,
      bookName: favorite.bookName,
      chapter: favorite.chapter,
      verse: favorite.verse,
      text: favorite.text,
      createdAt: favorite.createdAt,
      note: favorite.note,
      highlightColor: _convertHighlightColor(favorite.highlightColor),
    );
    await _box.put(favorite.id, favoriteModel);
  }

  Future<void> removeFavorite(String id) async {
    await _box.delete(id);
  }

  Future<bool> isFavorite(String bookName, int chapter, int verse) async {
    final favorites = _box.values.toList();
    return favorites.any((favorite) =>
        favorite.bookName == bookName &&
        favorite.chapter == chapter &&
        favorite.verse == verse);
  }

  Future<FavoriteVerseEntity?> getFavorite(String bookName, int chapter, int verse) async {
    final favorites = _box.values.toList();
    final favorite = favorites.firstWhere(
      (favorite) =>
          favorite.bookName == bookName &&
          favorite.chapter == chapter &&
          favorite.verse == verse,
      orElse: () => throw StateError('Favorite not found'),
    );
    
    if (favorite == null) return null;
    
    return FavoriteVerseEntity(
      id: favorite.id,
      bookName: favorite.bookName,
      chapter: favorite.chapter,
      verse: favorite.verse,
      text: favorite.text,
      createdAt: favorite.createdAt,
      note: favorite.note,
      highlightColor: _convertHighlightColor(favorite.highlightColor),
    );
  }

  Future<void> updateFavorite(FavoriteVerseEntity favorite) async {
    final favoriteModel = FavoriteVerse(
      id: favorite.id,
      bookName: favorite.bookName,
      chapter: favorite.chapter,
      verse: favorite.verse,
      text: favorite.text,
      createdAt: favorite.createdAt,
      note: favorite.note,
      highlightColor: _convertHighlightColor(favorite.highlightColor),
    );
    await _box.put(favorite.id, favoriteModel);
  }

  Future<void> clearAllFavorites() async {
    await _box.clear();
  }

  HighlightColor? _convertHighlightColor(HighlightColor? color) {
    if (color == null) return null;
    return color;
  }
}

