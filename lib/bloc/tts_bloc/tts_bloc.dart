import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../data/repositories/settings_repository.dart';
import '../../core/constants/app_constants.dart';

part 'tts_event.dart';
part 'tts_state.dart';

class TtsBloc extends Bloc<TtsEvent, TtsState> {
  final SettingsRepository _settingsRepository;
  late FlutterTts _flutterTts;

  TtsBloc({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(TtsInitial()) {
    _flutterTts = FlutterTts();
    _initializeTts();
    
    on<InitializeTts>(_onInitializeTts);
    on<StartSpeaking>(_onStartSpeaking);
    on<StopSpeaking>(_onStopSpeaking);
    on<PauseSpeaking>(_onPauseSpeaking);
    on<ResumeSpeaking>(_onResumeSpeaking);
    on<ChangeSpeechRate>(_onChangeSpeechRate);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  Future<void> _initializeTts() async {
    await _flutterTts.setLanguage("pt-BR");
    await _flutterTts.setSpeechRate(AppConstants.defaultSpeechRate);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);

    _flutterTts.setStartHandler(() {
      add(TtsStarted());
    });

    _flutterTts.setCompletionHandler(() {
      add(TtsCompleted());
    });

    _flutterTts.setErrorHandler((msg) {
      // Handle error without adding event
    });
  }

  Future<void> _onInitializeTts(InitializeTts event, Emitter<TtsState> emit) async {
    try {
      final speechRate = await _settingsRepository.getSpeechRate();
      final language = await _settingsRepository.getTtsLanguage();
      
      await _flutterTts.setSpeechRate(speechRate);
      await _flutterTts.setLanguage(language);
      
      emit(TtsInitialized(
        speechRate: speechRate,
        language: language,
      ));
    } catch (e) {
      emit(TtsError(message: e.toString()));
    }
  }

  Future<void> _onStartSpeaking(StartSpeaking event, Emitter<TtsState> emit) async {
    try {
      await _flutterTts.speak(event.text);
      emit(TtsSpeaking(text: event.text));
    } catch (e) {
      emit(TtsError(message: e.toString()));
    }
  }

  Future<void> _onStopSpeaking(StopSpeaking event, Emitter<TtsState> emit) async {
    try {
      await _flutterTts.stop();
      emit(TtsStopped());
    } catch (e) {
      emit(TtsError(message: e.toString()));
    }
  }

  Future<void> _onPauseSpeaking(PauseSpeaking event, Emitter<TtsState> emit) async {
    try {
      await _flutterTts.pause();
      emit(TtsPaused());
    } catch (e) {
      emit(TtsError(message: e.toString()));
    }
  }

  Future<void> _onResumeSpeaking(ResumeSpeaking event, Emitter<TtsState> emit) async {
    try {
      await _flutterTts.speak("");
      emit(TtsResumed());
    } catch (e) {
      emit(TtsError(message: e.toString()));
    }
  }

  Future<void> _onChangeSpeechRate(ChangeSpeechRate event, Emitter<TtsState> emit) async {
    try {
      await _settingsRepository.setSpeechRate(event.rate);
      await _flutterTts.setSpeechRate(event.rate);
      
      if (state is TtsInitialized) {
        final currentState = state as TtsInitialized;
        emit(TtsInitialized(
          speechRate: event.rate,
          language: currentState.language,
        ));
      } else {
        emit(TtsInitialized(
          speechRate: event.rate,
          language: "pt-BR",
        ));
      }
    } catch (e) {
      emit(TtsError(message: e.toString()));
    }
  }

  Future<void> _onChangeLanguage(ChangeLanguage event, Emitter<TtsState> emit) async {
    try {
      await _settingsRepository.setTtsLanguage(event.language);
      await _flutterTts.setLanguage(event.language);
      
      if (state is TtsInitialized) {
        final currentState = state as TtsInitialized;
        emit(TtsInitialized(
          speechRate: currentState.speechRate,
          language: event.language,
        ));
      } else {
        emit(TtsInitialized(
          speechRate: AppConstants.defaultSpeechRate,
          language: event.language,
        ));
      }
    } catch (e) {
      emit(TtsError(message: e.toString()));
    }
  }
}
