part of 'reading_plan_bloc.dart';

abstract class ReadingPlanEvent extends Equatable {
  const ReadingPlanEvent();

  @override
  List<Object> get props => [];
}

class LoadReadingPlans extends ReadingPlanEvent {
  const LoadReadingPlans();
}

class StartReadingPlan extends ReadingPlanEvent {
  final ReadingPlanEntity plan;

  const StartReadingPlan(this.plan);

  @override
  List<Object> get props => [plan];
}

class UpdateReadingPlanProgress extends ReadingPlanEvent {
  final int day;

  const UpdateReadingPlanProgress(this.day);

  @override
  List<Object> get props => [day];
}
