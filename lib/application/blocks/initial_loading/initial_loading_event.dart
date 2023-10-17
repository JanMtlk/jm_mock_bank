import 'package:equatable/equatable.dart';

sealed class InitialLoadingEvent extends Equatable {
  const InitialLoadingEvent();

  @override
  List<Object> get props => [];
}

final class InitialLoadingStarted extends InitialLoadingEvent {
  const InitialLoadingStarted() : super();

  @override
  List<Object> get props => [];
}

// final class InitialLoadingFinished extends InitialLoadingEvent {
//   const InitialLoadingFinished();
// }
