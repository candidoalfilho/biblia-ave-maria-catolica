import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../core/constants/app_constants.dart';
import '../../bloc/daily_reflection_bloc/daily_reflection_bloc.dart';
import '../../domain/entities/bible_entity.dart';
import '../../core/di/injection.dart';
import '../../data/repositories/purchase_repository.dart';

import 'package:share_plus/share_plus.dart';

class DailyReflectionScreen extends StatefulWidget {
  const DailyReflectionScreen({super.key});

  @override
  State<DailyReflectionScreen> createState() => _DailyReflectionScreenState();
}

class _DailyReflectionScreenState extends State<DailyReflectionScreen> {
  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  Future<void> _loadBannerAd() async {
    // Check if premium before loading
    try {
      final purchaseRepo = getIt<PurchaseRepository>();
      final isPremium = await purchaseRepo.isPremium();
      if (isPremium) {
        print('Skipping banner ad load in daily reflection - user is premium');
        return;
      }
    } catch (e) {
      print('Error checking premium status, loading ad anyway: $e');
    }

    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-9415784539457110/9432634518',
      listener: BannerAdListener(
        onAdLoaded: (_) {
          print('Banner ad loaded successfully in daily reflection');
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Banner failed to load in daily reflection: $err');
          ad.dispose();
          setState(() {
            _isBannerAdReady = false;
          });
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Salmo do Dia'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<DailyReflectionBloc>().add(const LoadDailyReflection());
            },
          ),
        ],
      ),
      body: BlocBuilder<DailyReflectionBloc, DailyReflectionState>(
        builder: (context, state) {
          if (state is DailyReflectionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DailyReflectionError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<DailyReflectionBloc>().add(const LoadDailyReflection());
                    },
                    child: const Text('Tentar Novamente'),
                  ),
                ],
              ),
            );
          } else if (state is DailyReflectionLoaded) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.1),
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(
                        AppConstants.defaultPadding,
                        kToolbarHeight + 40,
                        AppConstants.defaultPadding,
                        AppConstants.defaultPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDateHeader(state.reflection.date),
                          const SizedBox(height: AppConstants.largePadding),
                          _buildReflectionCard(state.reflection),
                        ],
                      ),
                    ),
                  ),
                  // Banner Ad (only show if not premium and ready)
                  if (_isBannerAdReady && _bannerAd != null)
                    FutureBuilder<bool>(
                      future: getIt<PurchaseRepository>().isPremium(),
                      builder: (context, snapshot) {
                        final isPremium = snapshot.data ?? false;
                        if (isPremium) {
                          return const SizedBox.shrink();
                        }
                        return Container(
                          alignment: Alignment.center,
                          width: _bannerAd!.size.width.toDouble(),
                          height: _bannerAd!.size.height.toDouble(),
                          child: AdWidget(ad: _bannerAd!),
                        );
                      },
                    ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildDateHeader(DateTime date) {
    final weekdays = [
      'Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira',
      'Quinta-feira', 'Sexta-feira', 'Sábado'
    ];
    final months = [
      'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
      'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weekdays[date.weekday % 7].toUpperCase(),
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${date.day} de ${months[date.month - 1]}',
          style: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildReflectionCard(DailyReflectionEntity reflection) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image or Gradient Header
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 48,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reflection.title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reflection.verse,
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Check if reflection contains refrão (starts with refrão)
                      if (reflection.reflection.contains('\n\n'))
                        ...[
                          Text(
                            reflection.reflection.split('\n\n').first,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              height: 1.6,
                              color: Theme.of(context).primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),
                        ],
                      Text(
                        reflection.text,
                        style: GoogleFonts.lora(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                // Show reflection (prayer) if it exists and is different from refrão
                if (reflection.reflection.contains('\n\n') && reflection.reflection.split('\n\n').length > 1)
                  ...[
                    const SizedBox(height: 24),
                    Text(
                      'Oração do Dia',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      reflection.reflection.split('\n\n').skip(1).join('\n\n'),
                      style: GoogleFonts.sourceSans3(
                        fontSize: 16,
                        height: 1.8,
                        color: Colors.black87.withOpacity(0.8),
                      ),
                    ),
                  ],
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Share.share(
                            '${reflection.title}\n\n"${reflection.text}"\n${reflection.verse}\n\n${reflection.reflection}\n\nCompartilhado via Bíblia Ave Maria',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text('Compartilhar'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



