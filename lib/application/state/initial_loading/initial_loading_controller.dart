import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

// import 'package:logger/logger.dart';

part 'initial_loading_state.dart';

class InitialLoadingController extends GetxController {
  InitialLoadingState loadingState = const InitialLoadingInitial();

  void initialize() async {
    // Logger().i("InitialLoadingController initialized");
    // Delayed
    await Future.delayed(const Duration(seconds: 1), () {
      // Logger().i("InitialLoadingController finished");
      loadingState = const InitialLoadingLoaded();
      update();
      // Logger().i(
      // "InitialLoadingController state is now ${loadingState.runtimeType}");
    });
  }
}
