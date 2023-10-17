import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/single_pages/settings_page.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/jmm_forward_icon.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/logout_button.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const ListTile(
                title: Text('Messages from Bank'),
                leading: Icon(Icons.message),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text('Banks and ATMs'),
                leading: Icon(Icons.apartment),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text('Invite friends'),
                leading: Icon(Icons.person_add),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text('Exchange rates'),
                leading: Icon(Icons.currency_exchange_sharp),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text('JMMB key'),
                leading: Icon(Icons.key),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text('App preview'),
                leading: Icon(Icons.lightbulb_outline_sharp),
                trailing: JmmForwardIcon(),
              ),
              ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings),
                trailing: const JmmForwardIcon(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
                },
              ),
            ],
          ),
        ),
        const LogoutButton()
      ],
    );
  }
}
