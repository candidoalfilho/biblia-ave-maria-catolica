import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/bible_entity.dart';
import '../../domain/usecases/favorites_usecases.dart';
import '../../data/models/bible_models.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetAllFavoritesUseCase _getAllFavoritesUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final IsFavoriteUseCase _isFavoriteUseCase;
  final GetFavoriteUseCase _getFavoriteUseCase;
  final UpdateFavoriteUseCase _updateFavoriteUseCase;
  final ClearAllFavoritesUseCase _clearAllFavoritesUseCase;

  FavoritesBloc({
    required GetAllFavoritesUseCase getAllFavoritesUseCase,
    required AddFavoriteUseCase addFavoriteUseCase,
    required RemoveFavoriteUseCase removeFavoriteUseCase,
    required IsFavoriteUseCase isFavoriteUseCase,
    required GetFavoriteUseCase getFavoriteUseCase,
    required UpdateFavoriteUseCase updateFavoriteUseCase,
    required ClearAllFavoritesUseCase clearAllFavoritesUseCase,
  })  : _getAllFavoritesUseCase = getAllFavoritesUseCase,
        _addFavoriteUseCase = addFavoriteUseCase,
        _removeFavoriteUseCase = removeFavoriteUseCase,
        _isFavoriteUseCase = isFavoriteUseCase,
        _getFavoriteUseCase = getFavoriteUseCase,
        _updateFavoriteUseCase = updateFavoriteUseCase,
        _clearAllFavoritesUseCase = clearAllFavoritesUseCase,
        super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
    on<ToggleFavorite>(_onToggleFavorite);
    on<UpdateFavorite>(_onUpdateFavorite);
    on<ClearAllFavorites>(_onClearAllFavorites);
    on<CheckIsFavorite>(_onCheckIsFavorite);
  }

  Future<void> _onLoadFavorites(LoadFavorites event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    try {
      final favorites = await _getAllFavoritesUseCase();
      emit(FavoritesLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> _onAddFavorite(AddFavorite event, Emitter<FavoritesState> emit) async {
    try {
      await _addFavoriteUseCase(event.favorite);
      final favorites = await _getAllFavoritesUseCase();
      emit(FavoritesLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> _onRemoveFavorite(RemoveFavorite event, Emitter<FavoritesState> emit) async {
    try {
      await _removeFavoriteUseCase(event.id);
      final favorites = await _getAllFavoritesUseCase();
      emit(FavoritesLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> _onToggleFavorite(ToggleFavorite event, Emitter<FavoritesState> emit) async {
    try {
      final isFavorite = await _isFavoriteUseCase(
        event.bookName,
        event.chapter,
        event.verse,
      );

      if (isFavorite) {
        final favorite = await _getFavoriteUseCase(
          event.bookName,
          event.chapter,
          event.verse,
        );
        if (favorite != null) {
          await _removeFavoriteUseCase(favorite.id);
        }
      } else {
        final favorite = FavoriteVerseEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          bookName: event.bookName,
          chapter: event.chapter,
          verse: event.verse,
          text: event.text,
          createdAt: DateTime.now(),
          note: event.note,
          highlightColor: event.highlightColor,
        );
        await _addFavoriteUseCase(favorite);
      }

      final favorites = await _getAllFavoritesUseCase();
      emit(FavoritesLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> _onUpdateFavorite(UpdateFavorite event, Emitter<FavoritesState> emit) async {
    try {
      await _updateFavoriteUseCase(event.favorite);
      final favorites = await _getAllFavoritesUseCase();
      emit(FavoritesLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> _onClearAllFavorites(ClearAllFavorites event, Emitter<FavoritesState> emit) async {
    try {
      await _clearAllFavoritesUseCase();
      emit(FavoritesLoaded(favorites: []));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> _onCheckIsFavorite(CheckIsFavorite event, Emitter<FavoritesState> emit) async {
    try {
      final isFavorite = await _isFavoriteUseCase(
        event.bookName,
        event.chapter,
        event.verse,
      );
      emit(FavoriteStatusChecked(isFavorite: isFavorite));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }
}
