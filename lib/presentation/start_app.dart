import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/approve_actions/approve_actions_controller.dart';
import 'package:jm_mock_bank/application/state/initial_loading/initial_loading_controller.dart';
import 'package:jm_mock_bank/presentation/initial_page.dart';
// import 'package:logger/logger.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  final InitialLoadingController _initialLoadingController = Get.put(
    InitialLoadingController(),
  );
  final ApproveActionsController _approveActionsController = Get.put(
    ApproveActionsController(),
  );

  @override
  void initState() {
    super.initState();
    _initialLoadingController.initialize();
    _approveActionsController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const InitialPage();
  }
}
