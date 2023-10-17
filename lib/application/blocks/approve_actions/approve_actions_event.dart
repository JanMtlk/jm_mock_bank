part of 'approve_actions_bloc.dart';

sealed class ApproveActionsEvent extends Equatable {
  const ApproveActionsEvent();

  @override
  List<Object> get props => [];
}

final class ApproveActionsInitializeEvent extends ApproveActionsEvent {
  const ApproveActionsInitializeEvent();
}

final class ApproveActionsApproveEvent extends ApproveActionsEvent {
  const ApproveActionsApproveEvent();
}

final class ApproveActionsDenyEvent extends ApproveActionsEvent {
  const ApproveActionsDenyEvent();
}
