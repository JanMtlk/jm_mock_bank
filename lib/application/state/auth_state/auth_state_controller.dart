import 'package:jm_mock_bank/application/state/env_controller.dart';
import 'package:jm_mock_bank/presentation/core/auth/login_page.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';
// import 'package:logger/logger.dart';

part 'auth_state_state.dart';

class AuthStateController extends GetxController {
  final EnvController _envController = Get.put(EnvController());
  AuthState authState = const AuthStateInitial();
  AuthState lastAuthState = const AuthStateInitial();
  String passwordField = "";
  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() {
    addListener(() {
      // Logger().e(
      //     "AuthStateController authState changed to ${authState.runtimeType}");
      //if user changed login state from logged in to logged out then show login page
      if (authState is AuthStateUnauthenticated &&
          lastAuthState is! AuthStateUnauthenticated) {
        Get.offAll(const LoginPage());
      }
      lastAuthState = authState;
    });
    if (_envController.env == Environment.dev) {
      authState = const AuthStateAuthenticated(id: "userid_AISfjsafsaff");
      update();
    }
  }

  void login() async {
    // Logger().i("Auth loging in");
    authState = const AuthStateLoading();
    update();
    // Delayed
    await Future.delayed(const Duration(seconds: 1), () {
      if (passwordField == "1111") {
        authState = const AuthStateAuthenticated(id: "userid_AISfjsafsaff");
      } else {
        Get.showSnackbar(const GetSnackBar(
            title: "Wrong password",
            message: "Please try again",
            duration: Duration(seconds: 4)));
        authState = const AuthStateError(message: "Wrong password");
      }
      //reset password field if it is right and even if it is wrong
      passwordField = "";
      update();
      // Logger().i("new auth state ${authState.runtimeType}");
    });
  }

  void logout() {
    authState = const AuthStateUnauthenticated();
    update();
  }

  // void updatePasswordField({required String checkedPassword}) {
  //   if (checkedPassword.length == 4) {
  //     login(checkedPassword: checkedPassword);
  //   } else if (passwordField.length < 5) {
  //     passwordField = checkedPassword;
  //     update();
  //   }
  // }
}
