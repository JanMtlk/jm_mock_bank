import 'package:meta/meta.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

part 'auth_state_state.dart';

class AuthStateController extends GetxController {
  AuthState authState = const AuthStateInitial();

  void login({required String password}) async {
    // Logger().i("Auth loging in");
    authState = const AuthStateLoading();
    update();
    // Delayed
    await Future.delayed(const Duration(seconds: 1), () {
      if (password == "1111") {
        authState = const AuthStateAuthenticated(id: "userid_AISfjsafsaff");
      } else {
        Get.showSnackbar(const GetSnackBar(
            title: "Wrong password",
            message: "Please try again",
            duration: Duration(seconds: 2)));
        authState = const AuthStateError(message: "Wrong password");
      }
      update();
      // Logger().i("new auth state ${authState.runtimeType}");
    });
  }
}
