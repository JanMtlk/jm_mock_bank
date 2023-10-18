import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/initial_loading/initial_loading_controller.dart';
import 'package:jm_mock_bank/presentation/core/start_app/login_page.dart';
import 'package:logger/logger.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    // handle loading of data from storage
    return GetBuilder<InitialLoadingController>(builder: (controller) {
      Logger().i("rebuilding with ${controller.loadingState}");
      if (controller.loadingState is InitialLoadingInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.loadingState is InitialLoadingLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.loadingState is InitialLoadingLoaded) {
        return const LoginPage();
      } else {
        return const Center(
          child: Text("Error"),
        );
      }
    });
  }
}
