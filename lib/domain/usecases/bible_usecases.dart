import 'package:injectable/injectable.dart';
import '../../data/repositories/bible_repository.dart';
import '../entities/bible_entity.dart';

@injectable
class GetBibleUseCase {
  final BibleRepository _repository;

  GetBibleUseCase(this._repository);

  Future<BibleEntity> call() async {
    return await _repository.getBibleEntity();
  }
}

@injectable
class SearchVersesUseCase {
  final BibleRepository _repository;

  SearchVersesUseCase(this._repository);

  Future<List<BibleReferenceEntity>> call(String query) async {
    if (query.length < 2) return [];
    return await _repository.searchVerses(query);
  }
}

@injectable
class GetVerseUseCase {
  final BibleRepository _repository;

  GetVerseUseCase(this._repository);

  Future<BibleReferenceEntity?> call(String bookName, int chapter, int verse) async {
    return await _repository.getVerse(bookName, chapter, verse);
  }
}

@injectable
class GetChaptersUseCase {
  final BibleRepository _repository;

  GetChaptersUseCase(this._repository);

  Future<List<ChapterEntity>> call(String bookName) async {
    return await _repository.getChapters(bookName);
  }
}

@injectable
class GetAllBookNamesUseCase {
  final BibleRepository _repository;

  GetAllBookNamesUseCase(this._repository);

  Future<List<String>> call() async {
    return await _repository.getAllBookNames();
  }
}



