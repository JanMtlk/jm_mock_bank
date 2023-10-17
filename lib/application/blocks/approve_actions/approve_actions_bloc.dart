import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'approve_actions_event.dart';
part 'approve_actions_state.dart';

class ApproveActionsBloc
    extends Bloc<ApproveActionsEvent, ApproveActionsState> {
  ApproveActionsBloc() : super(const ApproveActionsInitial()) {
    on<ApproveActionsInitializeEvent>((event, emit) async {
      Logger().i("Emitting initial approve actions state");
      emit(const ApproveActionsLoading());
      await Future.delayed(const Duration(seconds: 1), () {
        Logger().i("LoginEvent");
        emit(const ApproveActionsLoaded(actionsList: []));
      });
    });
    on<ApproveActionsApproveEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ApproveActionsDenyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
