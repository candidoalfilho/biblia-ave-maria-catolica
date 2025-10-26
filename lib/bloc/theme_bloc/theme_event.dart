part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class LoadTheme extends ThemeEvent {
  const LoadTheme();
}

class ChangeTheme extends ThemeEvent {
  final String themeMode;

  const ChangeTheme(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}

class ChangeFontSize extends ThemeEvent {
  final double fontSize;

  const ChangeFontSize(this.fontSize);

  @override
  List<Object?> get props => [fontSize];
}

class ChangeFontFamily extends ThemeEvent {
  final String fontFamily;

  const ChangeFontFamily(this.fontFamily);

  @override
  List<Object?> get props => [fontFamily];
}



