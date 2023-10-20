import 'dart:async';

import 'package:get/get.dart';

part 'approve_actions_state.dart';

class ApproveActionsController extends GetxController {
  ApproveActionsState approveActionsState = const ApproveActionsInitial();
  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() async {
    // Logger().i("approve actions init");
    approveActionsState = const ApproveActionsLoading();
    update();
    // Delayed
    await Future.delayed(const Duration(seconds: 1), () {
      approveActionsState = const ApproveActionsLoaded(actionsList: []);
      update();
      // Logger().i("new auth state ${approveActionsState.runtimeType}");
    });
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (approveActionsState is ApproveActionsLoaded &&
          (approveActionsState as ApproveActionsLoaded).actionsList.length <
              5) {
        approveActionsState = ApproveActionsLoaded(actionsList: [
          ...(approveActionsState as ApproveActionsLoaded).actionsList,
          "new request from Time ${DateTime.now().toUtc()}"
        ]);
        update();
      }
    });
  }

  void acceptAction(String actionName) {
    if (approveActionsState is ApproveActionsLoaded) {
      final List<String> actionsList =
          (approveActionsState as ApproveActionsLoaded).actionsList;
      actionsList.remove(actionName);
      approveActionsState = ApproveActionsLoaded(actionsList: actionsList);
      update();
    }
  }

  void rejectAction(String actionName) {
    if (approveActionsState is ApproveActionsLoaded) {
      final List<String> actionsList =
          (approveActionsState as ApproveActionsLoaded).actionsList;
      actionsList.remove(actionName);
      approveActionsState = ApproveActionsLoaded(actionsList: actionsList);
      update();
    }
  }
}
