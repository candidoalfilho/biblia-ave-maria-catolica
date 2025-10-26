import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../data/models/bible_models.dart';

class VerseText extends StatelessWidget {
  final String text;
  final int verseNumber;
  final double? fontSize;
  final String? fontFamily;
  final Color? textColor;
  final TextAlign textAlign;
  final bool isHighlighted;
  final HighlightColor? highlightColor;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const VerseText({
    super.key,
    required this.text,
    required this.verseNumber,
    this.fontSize,
    this.fontFamily,
    this.textColor,
    this.textAlign = TextAlign.justify,
    this.isHighlighted = false,
    this.highlightColor,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveFontSize = fontSize ?? theme.textTheme.bodyLarge?.fontSize ?? 16.0;
    final effectiveFontFamily = fontFamily ?? AppConstants.primaryFont;
    final effectiveTextColor = textColor ?? theme.textTheme.bodyLarge?.color;

    Color? backgroundColor;
    if (isHighlighted && highlightColor != null) {
      backgroundColor = _getHighlightColor(highlightColor!);
    }

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.smallPadding,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: RichText(
          textAlign: textAlign,
          text: TextSpan(
            children: [
              TextSpan(
                text: '$verseNumber ',
                style: TextStyle(
                  fontSize: effectiveFontSize * 0.8,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                  fontFamily: effectiveFontFamily,
                ),
              ),
              TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: effectiveFontSize,
                  color: effectiveTextColor,
                  fontFamily: effectiveFontFamily,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getHighlightColor(HighlightColor color) {
    switch (color) {
      case HighlightColor.yellow:
        return Colors.yellow.withOpacity(0.3);
      case HighlightColor.green:
        return Colors.green.withOpacity(0.3);
      case HighlightColor.blue:
        return Colors.blue.withOpacity(0.3);
      case HighlightColor.red:
        return Colors.red.withOpacity(0.3);
      case HighlightColor.purple:
        return Colors.purple.withOpacity(0.3);
      case HighlightColor.orange:
        return Colors.orange.withOpacity(0.3);
    }
  }
}

