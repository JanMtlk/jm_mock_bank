import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/initial_loading/initial_loading_controller.dart';
import 'package:jm_mock_bank/presentation/core/auth/login_page.dart';
// import 'package:jm_mock_bank/presentation/core/universal/jmmb_loader.dart';
import 'package:jm_mock_bank/presentation/core/universal/jmmb_loader_page.dart';
import 'package:logger/logger.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    // handle loading of data from storage
    return GetBuilder<InitialLoadingController>(builder: (controller) {
      Logger().i("rebuilding with ${controller.loadingState}");
      if (controller.loadingState is InitialLoadingInitial ||
          controller.loadingState is InitialLoadingLoading) {
        return const JMMBLoaderPage();
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
