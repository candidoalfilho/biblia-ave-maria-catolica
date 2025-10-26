import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bible_bloc/bible_bloc.dart';
import '../../bloc/favorites_bloc/favorites_bloc.dart';
import '../../bloc/tts_bloc/tts_bloc.dart';
import '../atoms/verse_text.dart';
import '../molecules/verse_card.dart';
import '../../domain/entities/bible_entity.dart';
import '../../core/constants/app_constants.dart';

class BibleReader extends StatefulWidget {
  final String? initialBook;
  final int? initialChapter;
  final List<dynamic>? chapters;

  const BibleReader({
    super.key,
    this.initialBook,
    this.initialChapter,
    this.chapters,
  });

  @override
  State<BibleReader> createState() => _BibleReaderState();
}

class _BibleReaderState extends State<BibleReader> {
  String? _currentBook;
  int? _currentChapter;
  List<ChapterEntity> _chapters = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _currentBook = widget.initialBook;
    _currentChapter = widget.initialChapter;
    
    if (widget.chapters != null) {
      _chapters = widget.chapters!.map((c) => ChapterEntity(
        chapterNumber: c.chapterNumber,
        verses: (c.verses as List<dynamic>).map((v) => VerseEntity(
          verseNumber: v.verseNumber,
          text: v.text,
        )).toList(),
      )).toList();
    }
  }

  void _loadChapters(String bookName) {
    setState(() {
      _isLoading = true;
    });
    
    context.read<BibleBloc>().add(GetChapters(bookName));
  }

  void _loadChapter(String bookName, int chapter) {
    setState(() {
      _currentBook = bookName;
      _currentChapter = chapter;
    });
  }

  void _previousChapter() {
    if (_currentChapter != null && _currentChapter! > 1) {
      _loadChapter(_currentBook!, _currentChapter! - 1);
    }
  }

  void _nextChapter() {
    if (_currentChapter != null && _currentChapter! < _chapters.length) {
      _loadChapter(_currentBook!, _currentChapter! + 1);
    }
  }

  void _toggleFavorite(VerseEntity verse) {
    context.read<FavoritesBloc>().add(
      ToggleFavorite(
        bookName: _currentBook!,
        chapter: _currentChapter!,
        verse: verse.verseNumber,
        text: verse.text,
      ),
    );
  }

  void _startTts(String text) {
    context.read<TtsBloc>().add(StartSpeaking(text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BibleBloc, BibleState>(
      listener: (context, state) {
        if (state is BibleChaptersLoaded) {
          setState(() {
            _chapters = state.chapters;
            _isLoading = false;
            if (_currentChapter == null && _chapters.isNotEmpty) {
              _currentChapter = 1;
            }
          });
        } else if (state is BibleError) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Column(
        children: [
          // Chapter Navigation
          if (_currentBook != null && _currentChapter != null)
            Container(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _currentChapter! > 1 ? _previousChapter : null,
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Expanded(
                    child: Text(
                      '$_currentBook $_currentChapter',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: _currentChapter! < _chapters.length ? _nextChapter : null,
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          // Chapter Content
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildChapterContent(),
          ),
          // TTS Controls
          if (_currentBook != null && _currentChapter != null && false)
            _buildTtsControls(),
        ],
      ),
    );
  }

  Widget _buildChapterContent() {
    if (_chapters.isEmpty || _currentChapter == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book, size: 64),
            SizedBox(height: 16),
            Text('Selecione um livro para começar a leitura'),
          ],
        ),
      );
    }

    final chapter = _chapters.firstWhere(
      (c) => c.chapterNumber == _currentChapter,
      orElse: () => _chapters.first,
    );

    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: chapter.verses.length,
      itemBuilder: (context, index) {
        final verse = chapter.verses[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppConstants.smallPadding),
          child: GestureDetector(
            onTap: () => _toggleFavorite(verse),
            onLongPress: () => _startTts(verse.text),
            child: VerseText(
              text: verse.text,
              verseNumber: verse.verseNumber,
            ),
          ),
        );
      },
    );
  }

  Widget _buildTtsControls() {
    return BlocBuilder<TtsBloc, TtsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  if (state is TtsSpeaking) {
                    context.read<TtsBloc>().add(const PauseSpeaking());
                  } else if (state is TtsPaused) {
                    context.read<TtsBloc>().add(const ResumeSpeaking());
                  } else {
                    // Start reading current chapter
                    final chapter = _chapters.firstWhere(
                      (c) => c.chapterNumber == _currentChapter,
                      orElse: () => _chapters.first,
                    );
                    final text = chapter.verses
                        .map((v) => '${v.verseNumber} ${v.text}')
                        .join(' ');
                    context.read<TtsBloc>().add(StartSpeaking(text));
                  }
                },
                icon: Icon(
                  state is TtsSpeaking
                      ? Icons.pause
                      : state is TtsPaused
                          ? Icons.play_arrow
                          : Icons.volume_up,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<TtsBloc>().add(const StopSpeaking());
                },
                icon: const Icon(Icons.stop),
              ),
            ],
          ),
        );
      },
    );
  }
}


