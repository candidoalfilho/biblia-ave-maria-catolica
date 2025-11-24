import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../bloc/bible_bloc/bible_bloc.dart';
import '../../bloc/favorites_bloc/favorites_bloc.dart';
import '../../bloc/tts_bloc/tts_bloc.dart';
import '../../bloc/streak_bloc/streak_bloc.dart';
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
  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;
  InterstitialAd? _interstitialAd;
  int _chapterReadCount = 0;
  static const int _chaptersForInterstitial = 3;

  @override
  void initState() {
    super.initState();
    context.read<BibleBloc>().add(const LoadBible());
    context.read<FavoritesBloc>().add(const LoadFavorites());
    _loadBannerAd();
    _loadInterstitialAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-9415784539457110/9432634518',
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Banner failed to load: $err');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9415784539457110/2874771507',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
              _loadInterstitialAd(); // Load next ad
            },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
              print('Interstitial failed to show: $error');
              ad.dispose();
              _loadInterstitialAd(); // Load next ad
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Interstitial failed to load: $error');
        },
      ),
    );
  }

  void _showInterstitialAdIfNeeded() {
    _chapterReadCount++;
    if (_chapterReadCount >= _chaptersForInterstitial && _interstitialAd != null) {
      _interstitialAd?.show();
      _chapterReadCount = 0; // Reset counter
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (query.isNotEmpty && query.length >= 2) {
      setState(() {
        _isSearching = true;
      });
      context.read<BibleBloc>().add(SearchVerses(query));
    } else {
      setState(() {
        _isSearching = false;
      });
      if (_selectedBook == null && _selectedChapter == null) {
        context.read<BibleBloc>().add(const LoadBible());
      }
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
    // Interstitial will be shown via callback when chapter is actually loaded
  }
  
  void _onChapterRead() {
    _showInterstitialAdIfNeeded(); // Show interstitial after reading chapters
    context.read<StreakBloc>().add(const UpdateStreak());
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
        title: Text(
          _selectedBook ?? 'Bíblia Ave Maria',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[50],
        iconTheme: const IconThemeData(color: Colors.black),
        leading: _selectedBook != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _onBackToBooks,
              )
            : null,
        actions: [
          BlocBuilder<StreakBloc, StreakState>(
            builder: (context, state) {
              if (state is StreakLoaded) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.local_fire_department, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        '${state.streak}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Column(
        children: [
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
                        onChapterRead: _onChapterRead,
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
          // Banner Ad
          if (_isBannerAdReady && _bannerAd != null && _selectedBook == null)
            Container(
              alignment: Alignment.center,
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
        ],
      ),
    );
  }

  Widget _buildBooksList(dynamic bible) {
    return Container(
      color: Colors.grey[50],
      child: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          // Old Testament
          _buildTestamentSection(
            'Antigo Testamento',
            bible.oldTestament,
            Icons.menu_book_rounded,
            const Color(0xFF6B4423),
          ),
          const SizedBox(height: AppConstants.largePadding),
          // New Testament
          _buildTestamentSection(
            'Novo Testamento',
            bible.newTestament,
            Icons.auto_stories_rounded,
            const Color(0xFF2E5C55),
          ),
        ],
      ),
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
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            title.toUpperCase(),
            style: GoogleFonts.outfit(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: color,
            ),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: testaments.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final testament = testaments[index];
            return _buildBookCard(testament, color);
          },
        ),
      ],
    );
  }

  Widget _buildBookCard(dynamic testament, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onBookSelected(testament.name),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      testament.name.substring(0, 1),
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        testament.name,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${testament.chapters.length} capítulos',
                        style: GoogleFonts.sourceSans3(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
              ],
            ),
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

    if (selectedBook == null) return const SizedBox.shrink();

    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SELECIONE O CAPÍTULO',
            style: GoogleFonts.outfit(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[400]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
            spreadRadius: 1,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onChapterSelected(chapterNumber),
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              '$chapterNumber',
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
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
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return VerseCard(
          reference: result,
          onTap: () {
            // Navigate to the verse location
            setState(() {
              _selectedBook = result.bookName;
              _selectedChapter = result.chapter;
              _isSearching = false;
            });
            _searchController.clear();
            context.read<BibleBloc>().add(const ClearSearch());
          },
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