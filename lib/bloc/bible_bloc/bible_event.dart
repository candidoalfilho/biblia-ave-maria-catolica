part of 'bible_bloc.dart';

abstract class BibleEvent extends Equatable {
  const BibleEvent();

  @override
  List<Object?> get props => [];
}

class LoadBible extends BibleEvent {
  const LoadBible();
}

class SearchVerses extends BibleEvent {
  final String query;

  const SearchVerses(this.query);

  @override
  List<Object?> get props => [query];
}

class GetVerse extends BibleEvent {
  final String bookName;
  final int chapter;
  final int verse;

  const GetVerse({
    required this.bookName,
    required this.chapter,
    required this.verse,
  });

  @override
  List<Object?> get props => [bookName, chapter, verse];
}

class GetChapters extends BibleEvent {
  final String bookName;

  const GetChapters(this.bookName);

  @override
  List<Object?> get props => [bookName];
}

class GetAllBookNames extends BibleEvent {
  const GetAllBookNames();
}

class ClearSearch extends BibleEvent {
  const ClearSearch();
}



