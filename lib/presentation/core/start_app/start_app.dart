import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/accounts/accounts_controller.dart';
import 'package:jm_mock_bank/application/state/approve_actions/approve_actions_controller.dart';
import 'package:jm_mock_bank/application/state/initial_loading/initial_loading_controller.dart';
import 'package:jm_mock_bank/application/state/new_payment_controller.dart';
import 'package:jm_mock_bank/presentation/core/auth/initial_page.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  Widget build(BuildContext context) {
    return const InitialPage();
  }
}

initControllers() async {
  final InitialLoadingController initialLoadingController = Get.put(
    InitialLoadingController(),
  );
  final ApproveActionsController approveActionsController = Get.put(
    ApproveActionsController(),
  );

  Get.put(NewPaymentController());
  final AccountsController accountsController = Get.put(
    AccountsController(),
  );
  accountsController.initialize();
  initialLoadingController.initialize();
  approveActionsController.initialize();
}
