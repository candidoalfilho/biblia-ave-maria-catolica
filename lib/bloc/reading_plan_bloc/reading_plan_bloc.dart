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
      // Filter active plan if any - a plan is active if currentDay is not null and > 0
      final activePlan = plans.cast<ReadingPlanEntity?>().firstWhere(
        (p) => p?.currentDay != null && p!.currentDay! > 0,
        orElse: () => null,
      );
      
      // Filter recommended plans - exclude active plan from recommended list
      final recommendedPlans = plans.where((p) => 
        p.currentDay == null || p.currentDay == 0 || p.id != activePlan?.id
      ).toList();
      
      emit(ReadingPlansLoaded(plans: recommendedPlans, activePlan: activePlan));
    } catch (e) {
      emit(ReadingPlanError(e.toString()));
    }
  }

  Future<void> _onStartReadingPlan(StartReadingPlan event, Emitter<ReadingPlanState> emit) async {
    try {
      // Add the plan with the calculated currentDay
      await repository.addPlan(event.plan);
      // If plan has a currentDay, ensure it's set correctly
      if (event.plan.currentDay != null && event.plan.currentDay! > 0) {
        await repository.setCurrentDay(event.plan.id, event.plan.currentDay!);
      }
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
          
          // Advance to next day if current day is completed
          final currentDay = currentState.activePlan!.currentDay ?? 1;
          if (event.day == currentDay && currentDay < currentState.activePlan!.durationDays) {
            await repository.setCurrentDay(currentState.activePlan!.id, currentDay + 1);
          } else if (event.day == currentDay && currentDay >= currentState.activePlan!.durationDays) {
            // Plan completed
            await repository.markPlanCompleted(currentState.activePlan!.id);
          }
          
          add(const LoadReadingPlans());
        } catch (e) {
          emit(ReadingPlanError(e.toString()));
        }
      }
    }
  }
}
