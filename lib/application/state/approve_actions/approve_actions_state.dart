part of 'approve_actions_controller.dart';

sealed class ApproveActionsState {
  const ApproveActionsState();
}

final class ApproveActionsInitial extends ApproveActionsState {
  const ApproveActionsInitial();
}

final class ApproveActionsLoading extends ApproveActionsState {
  const ApproveActionsLoading();
}

final class ApproveActionsLoaded extends ApproveActionsState {
  final List<String> actionsList;

  const ApproveActionsLoaded({required this.actionsList});
}
