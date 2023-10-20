import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/auth_state/auth_state_controller.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthStateController>(builder: (controller) {
      return ElevatedButton(
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout),
            SizedBox(
              width: 10,
            ),
            Text('Log out'),
          ],
        ),
        onPressed: () {
          controller.logout();
        },
      );
    });
  }
}
