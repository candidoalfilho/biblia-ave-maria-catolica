part of 'tts_bloc.dart';

abstract class TtsEvent extends Equatable {
  const TtsEvent();

  @override
  List<Object?> get props => [];
}

class InitializeTts extends TtsEvent {
  const InitializeTts();
}

class StartSpeaking extends TtsEvent {
  final String text;

  const StartSpeaking(this.text);

  @override
  List<Object?> get props => [text];
}

class StopSpeaking extends TtsEvent {
  const StopSpeaking();
}

class PauseSpeaking extends TtsEvent {
  const PauseSpeaking();
}

class ResumeSpeaking extends TtsEvent {
  const ResumeSpeaking();
}

class TtsStarted extends TtsEvent {
  const TtsStarted();
}

class TtsCompleted extends TtsEvent {
  const TtsCompleted();
}

class ChangeSpeechRate extends TtsEvent {
  final double rate;

  const ChangeSpeechRate(this.rate);

  @override
  List<Object?> get props => [rate];
}

class ChangeLanguage extends TtsEvent {
  final String language;

  const ChangeLanguage(this.language);

  @override
  List<Object?> get props => [language];
}



