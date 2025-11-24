import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/bible_entity.dart';
import '../../data/repositories/reflections_repository.dart';

part 'daily_reflection_event.dart';
part 'daily_reflection_state.dart';

class DailyReflectionBloc extends Bloc<DailyReflectionEvent, DailyReflectionState> {
  final ReflectionsRepository repository;

  DailyReflectionBloc({required this.repository}) : super(DailyReflectionInitial()) {
    on<LoadDailyReflection>(_onLoadDailyReflection);
  }

  Future<void> _onLoadDailyReflection(LoadDailyReflection event, Emitter<DailyReflectionState> emit) async {
    emit(DailyReflectionLoading());
    try {
      final now = DateTime.now();
      // Try to get today's reflection
      DailyReflectionEntity? reflection = await repository.getReflectionByDate(now);
      
      if (reflection == null) {
        // If not found, maybe we should fetch from API or generate one?
        // For now, let's just return an error or empty state if we don't have a backend to fetch from.
        // Or maybe we have a local list of reflections?
        // The repository seems to only fetch from Hive.
        // Let's assume for now we might need to seed it or it's empty.
        emit(const DailyReflectionError("Nenhuma reflexão para hoje."));
      } else {
        emit(DailyReflectionLoaded(reflection));
      }
    } catch (e) {
      emit(DailyReflectionError(e.toString()));
    }
  }
}
