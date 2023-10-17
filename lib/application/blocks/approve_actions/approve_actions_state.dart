part of 'approve_actions_bloc.dart';

sealed class ApproveActionsState extends Equatable {
  const ApproveActionsState();

  @override
  List<Object> get props => [];
}

final class ApproveActionsInitial extends ApproveActionsState {
  const ApproveActionsInitial();
}

final class ApproveActionsLoading extends ApproveActionsState {
  const ApproveActionsLoading();
}

final class ApproveActionsLoaded extends ApproveActionsState {
  final List<Object> actionsList;

  const ApproveActionsLoaded({required this.actionsList});

  @override
  List<Object> get props => [actionsList];
}
