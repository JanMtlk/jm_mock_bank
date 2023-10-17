import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/single_pages/banking_identity_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/client_number_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/documents_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/meetups_band_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/my_contact_details_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/settings_page.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';

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
                trailing: const Icon(Icons.keyboard_arrow_right),
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
                trailing: const Icon(Icons.keyboard_arrow_right),
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
                trailing: const Icon(Icons.keyboard_arrow_right),
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
                trailing: const Icon(Icons.keyboard_arrow_right),
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
                trailing: const Icon(Icons.keyboard_arrow_right),
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
                trailing: const Icon(Icons.keyboard_arrow_right),
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
          Contained(
              child: Column(
            children: [
              const Contained(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.fingerprint),
                        Text("Chat"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.devices_outlined),
                        Text("Call"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.notifications),
                        Text("Contacts"),
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton(
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
              ),
            ],
          ))
        ],
      ),
    );
  }
}
