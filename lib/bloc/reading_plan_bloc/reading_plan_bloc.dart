import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/bible_entity.dart';
import '../../data/repositories/reading_plans_repository.dart';

part 'reading_plan_event.dart';
part 'reading_plan_state.dart';

class ReadingPlanBloc extends Bloc<ReadingPlanEvent, ReadingPlanState> {
  final ReadingPlansRepository repository;

  ReadingPlanBloc({required this.repository}) : super(ReadingPlanInitial()) {
    on<LoadReadingPlans>(_onLoadReadingPlans);
    on<StartReadingPlan>(_onStartReadingPlan);
    on<UpdateReadingPlanProgress>(_onUpdateReadingPlanProgress);
  }

  Future<void> _onLoadReadingPlans(LoadReadingPlans event, Emitter<ReadingPlanState> emit) async {
    emit(ReadingPlanLoading());
    try {
      final plans = await repository.getAllPlans();
      // Filter active plan if any
      final activePlan = plans.cast<ReadingPlanEntity?>().firstWhere(
        (p) => p?.currentDay != null && p!.currentDay! > 0,
        orElse: () => null,
      );
      
      emit(ReadingPlansLoaded(plans: plans, activePlan: activePlan));
    } catch (e) {
      emit(ReadingPlanError(e.toString()));
    }
  }

  Future<void> _onStartReadingPlan(StartReadingPlan event, Emitter<ReadingPlanState> emit) async {
    try {
      await repository.addPlan(event.plan); // Or update to set started
      // For now, let's assume adding it starts it or we need a specific method
      // The repository has setCurrentDay, maybe that's how we track progress
      await repository.setCurrentDay(event.plan.id, 1);
      add(const LoadReadingPlans());
    } catch (e) {
      emit(ReadingPlanError(e.toString()));
    }
  }

  Future<void> _onUpdateReadingPlanProgress(UpdateReadingPlanProgress event, Emitter<ReadingPlanState> emit) async {
    if (state is ReadingPlansLoaded) {
      final currentState = state as ReadingPlansLoaded;
      if (currentState.activePlan != null) {
        try {
          await repository.markDayCompleted(currentState.activePlan!.id, event.day);
          add(const LoadReadingPlans());
        } catch (e) {
          emit(ReadingPlanError(e.toString()));
        }
      }
    }
  }
}
