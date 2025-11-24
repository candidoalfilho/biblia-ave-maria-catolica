part of 'streak_bloc.dart';

abstract class StreakState extends Equatable {
  const StreakState();
  
  @override
  List<Object> get props => [];
}

class StreakInitial extends StreakState {
  const StreakInitial();
}

class StreakLoaded extends StreakState {
  final int streak;

  const StreakLoaded(this.streak);

  @override
  List<Object> get props => [streak];
}

class StreakError extends StreakState {
  final String message;

  const StreakError(this.message);

  @override
  List<Object> get props => [message];
}
