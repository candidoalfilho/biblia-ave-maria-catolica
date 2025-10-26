part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoritesEvent {
  const LoadFavorites();
}

class AddFavorite extends FavoritesEvent {
  final FavoriteVerseEntity favorite;

  const AddFavorite(this.favorite);

  @override
  List<Object?> get props => [favorite];
}

class RemoveFavorite extends FavoritesEvent {
  final String id;

  const RemoveFavorite(this.id);

  @override
  List<Object?> get props => [id];
}

class ToggleFavorite extends FavoritesEvent {
  final String bookName;
  final int chapter;
  final int verse;
  final String text;
  final String? note;
  final HighlightColor? highlightColor;

  const ToggleFavorite({
    required this.bookName,
    required this.chapter,
    required this.verse,
    required this.text,
    this.note,
    this.highlightColor,
  });

  @override
  List<Object?> get props => [bookName, chapter, verse, text, note, highlightColor];
}

class UpdateFavorite extends FavoritesEvent {
  final FavoriteVerseEntity favorite;

  const UpdateFavorite(this.favorite);

  @override
  List<Object?> get props => [favorite];
}

class ClearAllFavorites extends FavoritesEvent {
  const ClearAllFavorites();
}

class CheckIsFavorite extends FavoritesEvent {
  final String bookName;
  final int chapter;
  final int verse;

  const CheckIsFavorite({
    required this.bookName,
    required this.chapter,
    required this.verse,
  });

  @override
  List<Object?> get props => [bookName, chapter, verse];
}
