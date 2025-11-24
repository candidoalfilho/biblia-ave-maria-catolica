import 'package:flutter/material.dart';
import '../atoms/custom_text_field.dart';
import '../../core/constants/app_constants.dart';

class SearchBar extends StatefulWidget {
  final String? hint;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  final bool showClearButton;
  final bool autofocus;

  const SearchBar({
    super.key,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.controller,
    this.showClearButton = true,
    this.autofocus = false,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
    widget.onChanged?.call(_controller.text);
  }

  void _onClear() {
    _controller.clear();
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CustomTextField(
        controller: _controller,
        hint: widget.hint ?? 'Buscar na Bíblia...',
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        prefixIcon: Icon(
          Icons.search,
          color: theme.primaryColor,
        ),
        suffixIcon: widget.showClearButton && _hasText
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: theme.primaryColor,
                ),
                onPressed: _onClear,
              )
            : null,
      ),
    );
  }
}
