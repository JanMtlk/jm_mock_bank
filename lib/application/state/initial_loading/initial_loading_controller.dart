import 'package:get/get.dart';

part 'initial_loading_state.dart';

class InitialLoadingController extends GetxController {
  InitialLoadingState loadingState = const InitialLoadingInitial();

  void initialize() async {
    // Logger().i("InitialLoadingController initialized");
    loadingState = const InitialLoadingLoading();
    update();
    // Delayed
    await Future.delayed(const Duration(milliseconds: 1), () {
      // Logger().i("InitialLoadingController finished");
      loadingState = const InitialLoadingLoaded();
      update();
      // Logger().i(
      // "InitialLoadingController state is now ${loadingState.runtimeType}");
    });
  }
}
