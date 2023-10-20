import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/env_controller.dart';
import 'package:logger/logger.dart';

part 'initial_loading_state.dart';

class InitialLoadingController extends GetxController {
  InitialLoadingState loadingState = const InitialLoadingInitial();

  final EnvController _envController = Get.put(EnvController());
  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() async {
    Logger().i("InitialLoadingController initialized");
    loadingState = const InitialLoadingLoading();
    update();
    // Delayed
    await Future.delayed(
        Duration(milliseconds: _envController.env == Environment.dev ? 0 : 500),
        () {
      // Logger().i("InitialLoadingController finished");
      loadingState = const InitialLoadingLoaded();
      update();
      // Logger().i(
      // "InitialLoadingController state is now ${loadingState.runtimeType}");
    });
  }
}
