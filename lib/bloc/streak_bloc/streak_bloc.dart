import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/streak_repository.dart';

part 'streak_event.dart';
part 'streak_state.dart';

class StreakBloc extends Bloc<StreakEvent, StreakState> {
  final StreakRepository streakRepository;

  StreakBloc({required this.streakRepository}) : super(const StreakInitial()) {
    on<LoadStreak>(_onLoadStreak);
    on<UpdateStreak>(_onUpdateStreak);
  }

  Future<void> _onLoadStreak(LoadStreak event, Emitter<StreakState> emit) async {
    try {
      final streak = await streakRepository.getCurrentStreak();
      emit(StreakLoaded(streak));
    } catch (e) {
      emit(const StreakError("Failed to load streak"));
    }
  }

  Future<void> _onUpdateStreak(UpdateStreak event, Emitter<StreakState> emit) async {
    try {
      await streakRepository.updateStreak();
      final streak = await streakRepository.getCurrentStreak();
      emit(StreakLoaded(streak));
    } catch (e) {
      emit(const StreakError("Failed to update streak"));
    }
  }
}
