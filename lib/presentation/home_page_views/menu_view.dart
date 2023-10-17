import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/logout_button.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              ListTile(
                title: Text('Messages'),
                leading: Icon(Icons.message),
                trailing: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
        const LogoutButton()
      ],
    );
  }
}
