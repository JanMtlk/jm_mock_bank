import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/auth_state/auth_state_controller.dart';
import 'package:jm_mock_bank/presentation/core/home_page.dart';
import 'package:jm_mock_bank/presentation/core/universal/jmmb_loader.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(AuthStateController());
  void onPressed(int index) {
    // Logger().i(index);
    if (controller.passwordField.length < 4) {
      if (index == 9) {
        // show alertbox
      } else if (index == 11) {
        if (controller.passwordField.isNotEmpty) {
          controller.passwordField = controller.passwordField
              .substring(0, controller.passwordField.length - 1);
          controller.update();
        }
      } else if (index == 10) {
        controller.passwordField = "${controller.passwordField}0";
        controller.update();
      } else {
        controller.passwordField = "${controller.passwordField}${index + 1}";
        controller.update();
      }
      if (controller.passwordField.length == 4) {
        controller.login();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          const Text("Enter your password"),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 30,
            child: GetBuilder<AuthStateController>(builder: (_) {
              if (controller.authState is AuthStateLoading ||
                  controller.authState is AuthStateAuthenticated) {
                if (controller.authState is AuthStateAuthenticated) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Get.offAll(() => const HomePage());
                  });
                }
                return const Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: JMMBLoader(
                        size: 20,
                      )),
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.passwordField.length; i++)
                      Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                      ),
                  ],
                );
              }
            }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  Widget child;
                  if (index == 10) {
                    child = const Text("0");
                  } else if (index == 9) {
                    child = const Icon(Icons.fingerprint, size: 40);
                  } else if (index == 11) {
                    child = const Icon(Icons.backspace, size: 25);
                  } else {
                    child = GestureDetector(child: Text("${index + 1}"));
                  }
                  return GestureDetector(
                    onTap: () {
                      onPressed(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(child: child),
                    ),
                  );
                }),
          ),
        ])));
  }
}
