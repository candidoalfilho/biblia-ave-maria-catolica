part of 'daily_reflection_bloc.dart';

abstract class DailyReflectionEvent extends Equatable {
  const DailyReflectionEvent();

  @override
  List<Object> get props => [];
}

class LoadDailyReflection extends DailyReflectionEvent {
  const LoadDailyReflection();
}
