part of 'tts_bloc.dart';

abstract class TtsState extends Equatable {
  const TtsState();

  @override
  List<Object?> get props => [];
}

class TtsInitial extends TtsState {}

class TtsInitialized extends TtsState {
  final double speechRate;
  final String language;

  const TtsInitialized({
    required this.speechRate,
    required this.language,
  });

  @override
  List<Object?> get props => [speechRate, language];
}

class TtsSpeaking extends TtsState {
  final String text;

  const TtsSpeaking({required this.text});

  @override
  List<Object?> get props => [text];
}

class TtsPaused extends TtsState {}

class TtsResumed extends TtsState {}

class TtsStopped extends TtsState {}

class TtsError extends TtsState {
  final String message;

  const TtsError({required this.message});

  @override
  List<Object?> get props => [message];
}



