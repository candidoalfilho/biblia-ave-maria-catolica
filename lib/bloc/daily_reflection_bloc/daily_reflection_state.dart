part of 'daily_reflection_bloc.dart';

abstract class DailyReflectionState extends Equatable {
  const DailyReflectionState();
  
  @override
  List<Object> get props => [];
}

class DailyReflectionInitial extends DailyReflectionState {}

class DailyReflectionLoading extends DailyReflectionState {}

class DailyReflectionLoaded extends DailyReflectionState {
  final DailyReflectionEntity reflection;

  const DailyReflectionLoaded(this.reflection);

  @override
  List<Object> get props => [reflection];
}

class DailyReflectionError extends DailyReflectionState {
  final String message;

  const DailyReflectionError(this.message);

  @override
  List<Object> get props => [message];
}
