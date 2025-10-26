import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final IconData? icon;
  final bool isLoading;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Widget buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isLoading)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                type == ButtonType.primary ? Colors.white : theme.primaryColor,
              ),
            ),
          )
        else if (icon != null)
          Icon(icon, size: 20),
        if ((isLoading || icon != null) && text.isNotEmpty)
          const SizedBox(width: 8),
        if (text.isNotEmpty)
          Text(text),
      ],
    );

    if (width != null || height != null) {
      buttonChild = SizedBox(
        width: width,
        height: height,
        child: Center(child: buttonChild),
      );
    }

    switch (type) {
      case ButtonType.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: buttonChild,
        );
      case ButtonType.secondary:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          child: buttonChild,
        );
      case ButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          child: buttonChild,
        );
      case ButtonType.icon:
        return IconButton(
          onPressed: isLoading ? null : onPressed,
          icon: buttonChild,
        );
    }
  }
}

enum ButtonType {
  primary,
  secondary,
  text,
  icon,
}



