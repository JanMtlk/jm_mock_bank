import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
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
      onPressed: () {},
    );
  }
}
