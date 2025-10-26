part of 'bible_bloc.dart';

abstract class BibleState extends Equatable {
  const BibleState();

  @override
  List<Object?> get props => [];
}

class BibleInitial extends BibleState {}

class BibleLoading extends BibleState {}

class BibleLoaded extends BibleState {
  final BibleEntity bible;

  const BibleLoaded({required this.bible});

  @override
  List<Object?> get props => [bible];
}

class BibleSearching extends BibleState {}

class BibleSearchResults extends BibleState {
  final List<BibleReferenceEntity> results;

  const BibleSearchResults({required this.results});

  @override
  List<Object?> get props => [results];
}

class BibleVerseLoaded extends BibleState {
  final BibleReferenceEntity? verse;

  const BibleVerseLoaded({required this.verse});

  @override
  List<Object?> get props => [verse];
}

class BibleChaptersLoaded extends BibleState {
  final List<ChapterEntity> chapters;
  final String bookName;

  const BibleChaptersLoaded({
    required this.chapters,
    required this.bookName,
  });

  @override
  List<Object?> get props => [chapters, bookName];
}

class BibleBookNamesLoaded extends BibleState {
  final List<String> bookNames;

  const BibleBookNamesLoaded({required this.bookNames});

  @override
  List<Object?> get props => [bookNames];
}

class BibleError extends BibleState {
  final String message;

  const BibleError({required this.message});

  @override
  List<Object?> get props => [message];
}



