import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bible_bloc/bible_bloc.dart';
import '../../bloc/favorites_bloc/favorites_bloc.dart';
import '../../bloc/tts_bloc/tts_bloc.dart';
import '../molecules/search_bar.dart' as custom;
import '../molecules/verse_card.dart';
import '../organisms/bible_reader.dart';
import '../organisms/book_selector.dart';
import '../../core/constants/app_constants.dart';

class BibleReadingScreen extends StatefulWidget {
  const BibleReadingScreen({super.key});

  @override
  State<BibleReadingScreen> createState() => _BibleReadingScreenState();
}

class _BibleReadingScreenState extends State<BibleReadingScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  String? _selectedBook;
  int? _selectedChapter;

  @override
  void initState() {
    super.initState();
    context.read<BibleBloc>().add(const LoadBible());
    context.read<FavoritesBloc>().add(const LoadFavorites());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (query.length >= 2) {
      setState(() {
        _isSearching = true;
      });
      context.read<BibleBloc>().add(SearchVerses(query));
    } else {
      setState(() {
        _isSearching = false;
      });
      context.read<BibleBloc>().add(const ClearSearch());
    }
  }

  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty) {
      _onSearchChanged(query);
    }
  }

  void _onSearchClear() {
    setState(() {
      _isSearching = false;
    });
    _searchController.clear();
    context.read<BibleBloc>().add(const ClearSearch());
  }

  void _onBookSelected(String bookName) {
    setState(() {
      _selectedBook = bookName;
      _selectedChapter = null;
    });
    // No need to call GetChapters as we already have the data
  }

  void _onChapterSelected(int chapter) {
    setState(() {
      _selectedChapter = chapter;
    });
  }

  void _onBackToBooks() {
    setState(() {
      _selectedBook = null;
      _selectedChapter = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedBook ?? 'Bíblia Ave Maria'),
        leading: _selectedBook != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _onBackToBooks,
              )
            : null,
      ),
      body: Column(
        children: [
          // Search Bar
          if(_selectedBook == null)...[
          Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: custom.SearchBar(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
              onClear: _onSearchClear,
            ),
          ),],
          // Content
          Expanded(
            child: BlocBuilder<BibleBloc, BibleState>(
              builder: (context, state) {
                if (state is BibleLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BibleError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Erro ao carregar a Bíblia',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.message,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<BibleBloc>().add(const LoadBible());
                          },
                          child: const Text('Tentar Novamente'),
                        ),
                      ],
                    ),
                  );
                } else if (state is BibleSearchResults) {
                  return _buildSearchResults(state.results);
                } else if (state is BibleLoaded) {
                  if (_selectedBook != null) {
                    if (_selectedChapter != null) {
                      // Find the selected book and pass its chapters
                      dynamic selectedBook;
                      for (final testament in state.bible.oldTestament) {
                        if (testament.name == _selectedBook) {
                          selectedBook = testament;
                          break;
                        }
                      }
                      if (selectedBook == null) {
                        for (final testament in state.bible.newTestament) {
                          if (testament.name == _selectedBook) {
                            selectedBook = testament;
                            break;
                          }
                        }
                      }
                      
                      return BibleReader(
                        initialBook: _selectedBook,
                        initialChapter: _selectedChapter,
                        chapters: selectedBook?.chapters,
                      );
                    } else {
                      return _buildChapterSelector(state.bible);
                    }
                  } else {
                    return _buildBooksList(state.bible);
                  }
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBooksList(dynamic bible) {
    return ListView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      children: [
        // Old Testament
        _buildTestamentSection(
          'Antigo Testamento',
          bible.oldTestament,
          Icons.menu_book,
          Colors.blue,
        ),
        const SizedBox(height: AppConstants.largePadding),
        // New Testament
        _buildTestamentSection(
          'Novo Testamento',
          bible.newTestament,
          Icons.book,
          Colors.green,
        ),
      ],
    );
  }

  Widget _buildTestamentSection(
    String title,
    List<dynamic> testaments,
    IconData icon,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
            vertical: AppConstants.smallPadding,
          ),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppConstants.defaultPadding),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: testaments.length,
          itemBuilder: (context, index) {
            final testament = testaments[index];
            return _buildBookCard(testament, color);
          },
        ),
      ],
    );
  }

  Widget _buildBookCard(dynamic testament, Color color) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => _onBookSelected(testament.name),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
            vertical: AppConstants.smallPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            color: color.withOpacity(0.1),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.menu_book,
                color: color,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  testament.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${testament.chapters.length}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: color.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChapterSelector(dynamic bible) {
    // Find the selected book
    dynamic selectedBook;
    
    // Search in Old Testament
    for (final testament in bible.oldTestament) {
      if (testament.name == _selectedBook) {
        selectedBook = testament;
        break;
      }
    }
    
    // Search in New Testament if not found
    if (selectedBook == null) {
      for (final testament in bible.newTestament) {
        if (testament.name == _selectedBook) {
          selectedBook = testament;
          break;
        }
      }
    }

    if (selectedBook == null) {
      return const Center(
        child: Text('Livro não encontrado'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selecione um capítulo',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: selectedBook.chapters.length,
              itemBuilder: (context, index) {
                final chapter = selectedBook.chapters[index];
                return _buildChapterCard(chapter.chapterNumber);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChapterCard(int chapterNumber) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => _onChapterSelected(chapterNumber),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
          ),
          child: Center(
            child: Text(
              '$chapterNumber',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(List<dynamic> results) {
    if (results.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64),
            SizedBox(height: 16),
            Text('Nenhum resultado encontrado'),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return VerseCard(
          reference: result,
          onFavorite: () {
            context.read<FavoritesBloc>().add(
              ToggleFavorite(
                bookName: result.bookName,
                chapter: result.chapter,
                verse: result.verse,
                text: result.text ?? '',
              ),
            );
          },
        );
      },
    );
  }
}