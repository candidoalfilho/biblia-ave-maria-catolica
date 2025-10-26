import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/settings_repository.dart';
import '../../core/constants/app_constants.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SettingsRepository _settingsRepository;

  ThemeBloc({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(ThemeInitial()) {
    on<LoadTheme>(_onLoadTheme);
    on<ChangeTheme>(_onChangeTheme);
    on<ChangeFontSize>(_onChangeFontSize);
    on<ChangeFontFamily>(_onChangeFontFamily);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    try {
      final themeMode = await _settingsRepository.getThemeMode();
      final fontSize = await _settingsRepository.getFontSize();
      final fontFamily = await _settingsRepository.getFontFamily();

      emit(ThemeLoaded(
        themeMode: themeMode,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ));
    } catch (e) {
      emit(ThemeError(message: e.toString()));
    }
  }

  Future<void> _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    try {
      await _settingsRepository.setThemeMode(event.themeMode);
      
      if (state is ThemeLoaded) {
        final currentState = state as ThemeLoaded;
        emit(ThemeLoaded(
          themeMode: event.themeMode,
          fontSize: currentState.fontSize,
          fontFamily: currentState.fontFamily,
        ));
      } else {
        emit(ThemeLoaded(
          themeMode: event.themeMode,
          fontSize: 16.0,
          fontFamily: AppConstants.primaryFont,
        ));
      }
    } catch (e) {
      emit(ThemeError(message: e.toString()));
    }
  }

  Future<void> _onChangeFontSize(ChangeFontSize event, Emitter<ThemeState> emit) async {
    try {
      await _settingsRepository.setFontSize(event.fontSize);
      
      if (state is ThemeLoaded) {
        final currentState = state as ThemeLoaded;
        emit(ThemeLoaded(
          themeMode: currentState.themeMode,
          fontSize: event.fontSize,
          fontFamily: currentState.fontFamily,
        ));
      } else {
        emit(ThemeLoaded(
          themeMode: AppConstants.systemThemeKey,
          fontSize: event.fontSize,
          fontFamily: AppConstants.primaryFont,
        ));
      }
    } catch (e) {
      emit(ThemeError(message: e.toString()));
    }
  }

  Future<void> _onChangeFontFamily(ChangeFontFamily event, Emitter<ThemeState> emit) async {
    try {
      await _settingsRepository.setFontFamily(event.fontFamily);
      
      if (state is ThemeLoaded) {
        final currentState = state as ThemeLoaded;
        emit(ThemeLoaded(
          themeMode: currentState.themeMode,
          fontSize: currentState.fontSize,
          fontFamily: event.fontFamily,
        ));
      } else {
        emit(ThemeLoaded(
          themeMode: AppConstants.systemThemeKey,
          fontSize: 16.0,
          fontFamily: event.fontFamily,
        ));
      }
    } catch (e) {
      emit(ThemeError(message: e.toString()));
    }
  }
}



