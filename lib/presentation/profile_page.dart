import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/single_pages/banking_identity_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/client_number_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/documents_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/meetups_band_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/my_contact_details_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/settings_page.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/jmm_forward_icon.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/logout_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Contained(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "John Tester",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Personal Mock Banking",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          Contained(
              child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.manage_accounts),
                title: const Text("My Contact Details"),
                trailing: const JmmForwardIcon(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyContactDetailsPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.pause_presentation),
                title: const Text("My Client Number"),
                trailing: const JmmForwardIcon(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ClientNumberPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.document_scanner),
                title: const Text("Documents"),
                trailing: const JmmForwardIcon(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DocumentsPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.key),
                title: const Text("Banking Identity JMMB"),
                trailing: const JmmForwardIcon(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BankingIdentityPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.holiday_village_sharp),
                title: const Text("Meetups in person"),
                trailing: const JmmForwardIcon(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MeetupsBankPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("App Settings"),
                trailing: const JmmForwardIcon(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              ),
            ],
          )),
          const Contained(
              child: Column(
            children: [
              Contained(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.chat_outlined),
                        Text("Chat"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.phone),
                        Text("Call"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.import_contacts_sharp),
                        Text("Contacts"),
                      ],
                    )
                  ],
                ),
              ),
              LogoutButton(),
            ],
          ))
        ],
      ),
    );
  }
}
