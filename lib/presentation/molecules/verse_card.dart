import 'package:flutter/material.dart';
import '../atoms/verse_text.dart';
import '../atoms/custom_button.dart';
import '../../domain/entities/bible_entity.dart';
import '../../core/constants/app_constants.dart';

class VerseCard extends StatelessWidget {
  final BibleReferenceEntity reference;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;
  final VoidCallback? onHighlight;
  final bool showActions;
  final double? fontSize;

  const VerseCard({
    super.key,
    required this.reference,
    this.isFavorite = false,
    this.onTap,
    this.onFavorite,
    this.onShare,
    this.onHighlight,
    this.showActions = false,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.smallPadding,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reference header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${reference.bookName} ${reference.chapter}:${reference.verse}',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (showActions) ...[
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : theme.primaryColor,
                      ),
                      onPressed: onFavorite,
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: theme.primaryColor,
                      ),
                      onSelected: (value) {
                        switch (value) {
                          case 'share':
                            onShare?.call();
                            break;
                          case 'highlight':
                            onHighlight?.call();
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'share',
                          child: Row(
                            children: [
                              Icon(Icons.share),
                              SizedBox(width: 8),
                              Text('Compartilhar'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'highlight',
                          child: Row(
                            children: [
                              Icon(Icons.highlight),
                              SizedBox(width: 8),
                              Text('Destacar'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              const SizedBox(height: AppConstants.smallPadding),
              // Verse text
              if (reference.text != null)
                VerseText(
                  text: reference.text!,
                  verseNumber: reference.verse,
                  fontSize: fontSize,
                ),
            ],
          ),
        ),
      ),
    );
  }
}



