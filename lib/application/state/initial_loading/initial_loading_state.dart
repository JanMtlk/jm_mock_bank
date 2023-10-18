part of 'initial_loading_controller.dart';

sealed class InitialLoadingState extends Equatable {
  const InitialLoadingState();
}

final class InitialLoadingInitial extends InitialLoadingState {
  const InitialLoadingInitial();
  @override
  List<Object?> get props => [];
}

final class InitialLoadingLoading extends InitialLoadingState {
  const InitialLoadingLoading();
  @override
  List<Object?> get props => [];
}

final class InitialLoadingLoaded extends InitialLoadingState {
  const InitialLoadingLoaded();
  @override
  List<Object?> get props => [];
}
