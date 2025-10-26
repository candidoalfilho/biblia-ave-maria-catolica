part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final String themeMode;
  final double fontSize;
  final String fontFamily;

  const ThemeLoaded({
    required this.themeMode,
    required this.fontSize,
    required this.fontFamily,
  });

  @override
  List<Object?> get props => [themeMode, fontSize, fontFamily];
}

class ThemeError extends ThemeState {
  final String message;

  const ThemeError({required this.message});

  @override
  List<Object?> get props => [message];
}



