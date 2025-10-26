import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/bible_entity.dart';
import '../../domain/usecases/bible_usecases.dart';

part 'bible_event.dart';
part 'bible_state.dart';

class BibleBloc extends Bloc<BibleEvent, BibleState> {
  final GetBibleUseCase _getBibleUseCase;
  final SearchVersesUseCase _searchVersesUseCase;
  final GetVerseUseCase _getVerseUseCase;
  final GetChaptersUseCase _getChaptersUseCase;
  final GetAllBookNamesUseCase _getAllBookNamesUseCase;

  BibleBloc({
    required GetBibleUseCase getBibleUseCase,
    required SearchVersesUseCase searchVersesUseCase,
    required GetVerseUseCase getVerseUseCase,
    required GetChaptersUseCase getChaptersUseCase,
    required GetAllBookNamesUseCase getAllBookNamesUseCase,
  })  : _getBibleUseCase = getBibleUseCase,
        _searchVersesUseCase = searchVersesUseCase,
        _getVerseUseCase = getVerseUseCase,
        _getChaptersUseCase = getChaptersUseCase,
        _getAllBookNamesUseCase = getAllBookNamesUseCase,
        super(BibleInitial()) {
    on<LoadBible>(_onLoadBible);
    on<SearchVerses>(_onSearchVerses);
    on<GetVerse>(_onGetVerse);
    on<GetChapters>(_onGetChapters);
    on<GetAllBookNames>(_onGetAllBookNames);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onLoadBible(LoadBible event, Emitter<BibleState> emit) async {
    emit(BibleLoading());
    try {
      final bible = await _getBibleUseCase();
      emit(BibleLoaded(bible: bible));
    } catch (e) {
      emit(BibleError(message: e.toString()));
    }
  }

  Future<void> _onSearchVerses(SearchVerses event, Emitter<BibleState> emit) async {
    if (event.query.length < 2) {
      emit(BibleLoaded(bible: (state as BibleLoaded).bible));
      return;
    }

    emit(BibleSearching());
    try {
      final results = await _searchVersesUseCase(event.query);
      emit(BibleSearchResults(results: results));
    } catch (e) {
      emit(BibleError(message: e.toString()));
    }
  }

  Future<void> _onGetVerse(GetVerse event, Emitter<BibleState> emit) async {
    try {
      final verse = await _getVerseUseCase(event.bookName, event.chapter, event.verse);
      emit(BibleVerseLoaded(verse: verse));
    } catch (e) {
      emit(BibleError(message: e.toString()));
    }
  }

  Future<void> _onGetChapters(GetChapters event, Emitter<BibleState> emit) async {
    try {
      final chapters = await _getChaptersUseCase(event.bookName);
      emit(BibleChaptersLoaded(chapters: chapters, bookName: event.bookName));
    } catch (e) {
      emit(BibleError(message: e.toString()));
    }
  }

  Future<void> _onGetAllBookNames(GetAllBookNames event, Emitter<BibleState> emit) async {
    try {
      final bookNames = await _getAllBookNamesUseCase();
      emit(BibleBookNamesLoaded(bookNames: bookNames));
    } catch (e) {
      emit(BibleError(message: e.toString()));
    }
  }

  Future<void> _onClearSearch(ClearSearch event, Emitter<BibleState> emit) async {
    if (state is BibleLoaded) {
      emit(state);
    } else {
      emit(BibleInitial());
    }
  }
}



