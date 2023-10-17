import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:jm_mock_bank/application/blocks/initial_loading/initial_loading_event.dart';

part 'initial_loading_state.dart';

class InitialLoadingBloc
    extends Bloc<InitialLoadingEvent, InitialLoadingState> {
  InitialLoadingBloc() : super(const InitialLoadingLoading()) {
    on<InitialLoadingStarted>((event, emit) => _loadData(event, emit));
  }
  void _loadData(
      InitialLoadingStarted event, Emitter<InitialLoadingState> emit) async {
    emit(const InitialLoadingLoading());
    //TODO: change for more real value
    await Future.delayed(const Duration(milliseconds: 1), () {
      emit(const InitialLoadingLoaded());
    });
  }
}
