import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/auth_state/auth_state_controller.dart';
import 'package:jm_mock_bank/presentation/home_page.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(AuthStateController());
  String password = "";
  void onPressed(int index) {
    if (password.length == 4) {
      return;
    }
    // Logger().i(index);
    if (index == 9) {
      // show alertbox
    } else if (index == 11) {
      if (password.isNotEmpty) {
        setState(() {
          password = password.substring(0, password.length - 1);
        });
      }
    } else if (index == 10) {
      setState(() {
        password = "${password}0";
      });
    } else {
      setState(() {
        password = "$password${index + 1}";
      });
    }
    if (password.length == 4) {
      // check password
      // if correct, go to home page
      // else, show alertbox
      Logger().d("calling login event");
      controller.login(password: password);
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
              if (controller.authState is AuthStateError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // clear password
                  setState(() {
                    password = "";
                  });
                  controller.authState = const AuthStateInitial();
                  controller.update();
                });
                return const CircularProgressIndicator();
              }
              if (controller.authState is AuthStateLoading) {
                return const CircularProgressIndicator();
              } else if (controller.authState is AuthStateAuthenticated) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Get.offAll(() => const HomePage());
                });
                return const CircularProgressIndicator();
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < password.length; i++)
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
