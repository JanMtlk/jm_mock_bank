part of 'initial_loading_controller.dart';

sealed class InitialLoadingState {
  const InitialLoadingState();
}

final class InitialLoadingInitial extends InitialLoadingState {
  const InitialLoadingInitial();
}

final class InitialLoadingLoading extends InitialLoadingState {
  const InitialLoadingLoading();
}

final class InitialLoadingLoaded extends InitialLoadingState {
  const InitialLoadingLoaded();
}
