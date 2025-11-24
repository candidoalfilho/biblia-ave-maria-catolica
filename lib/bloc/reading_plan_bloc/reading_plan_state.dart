part of 'reading_plan_bloc.dart';

abstract class ReadingPlanState extends Equatable {
  const ReadingPlanState();
  
  @override
  List<Object?> get props => [];
}

class ReadingPlanInitial extends ReadingPlanState {}

class ReadingPlanLoading extends ReadingPlanState {}

class ReadingPlansLoaded extends ReadingPlanState {
  final List<ReadingPlanEntity> plans;
  final ReadingPlanEntity? activePlan;

  const ReadingPlansLoaded({required this.plans, this.activePlan});

  ReadingPlansLoaded copyWith({
    List<ReadingPlanEntity>? plans,
    ReadingPlanEntity? activePlan,
  }) {
    return ReadingPlansLoaded(
      plans: plans ?? this.plans,
      activePlan: activePlan ?? this.activePlan,
    );
  }

  @override
  List<Object?> get props => [plans, activePlan];
}

class ReadingPlanError extends ReadingPlanState {
  final String message;

  const ReadingPlanError(this.message);

  @override
  List<Object> get props => [message];
}
