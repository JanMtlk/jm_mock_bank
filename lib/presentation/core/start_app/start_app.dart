import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/accounts/accounts_controller.dart';
import 'package:jm_mock_bank/application/state/approve_actions/approve_actions_controller.dart';
import 'package:jm_mock_bank/application/state/auth_state/auth_state_controller.dart';
import 'package:jm_mock_bank/application/state/env_controller.dart';
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
    initApp();
  }

  @override
  Widget build(BuildContext context) {
    return const InitialPage();
  }
}

void initApp() {
  initControllers();
}

void initControllers() async {
  // This is the controller that determines the environment prod or dev
  Get.put(EnvController());
  // loads mock initial data from db or somewhere
  Get.put(InitialLoadingController());
  // handles actions to approve and adds Timer that adds action every now and then to approve
  Get.put(ApproveActionsController());
  // handles New payment state
  Get.put(NewPaymentController());
  // handles Accounts that the user has, it adds mockup ones
  Get.put(AccountsController());
  // handles Auth state
  Get.put(AuthStateController());
}
