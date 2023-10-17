import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          Contained(
            child: Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Contained(
                  child: Text(
                    "Contact Details",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [Icon(Icons.fingerprint), Text("Fingerprint")],
                    ),
                    Column(
                      children: [
                        Icon(Icons.devices_outlined),
                        Text("Activate")
                      ],
                    ),
                    Column(
                      children: [Icon(Icons.notifications), Text("Inform Me")],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
          ),
          Contained(
            child: Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Contained(
                  child: Text(
                    "Security",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                    title: const Text("Setup Fingerprints"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Change S-PIN"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Payment Limits"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Default login account"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Device Management"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Enable reactivation"),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) => {},
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Homescreen Widget settings"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
          ),
          Contained(
            child: Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Contained(
                  child: Text(
                    "Notifications and Alerts",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                    title: const Text("Inform me"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Sales and discounts"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
          ),
          Contained(
            child: Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Contained(
                  child: Text(
                    "Theme and Appearance",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                    title: const Text("Home screen settings"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Blur Balance"),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) => {},
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("App Theme"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Language"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "English",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                    onTap: () {}),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
          ),
          Contained(
            child: Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Contained(
                  child: Text(
                    "Permissions",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                    title: const Text("System permissions"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("GDPR Consent"),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.purple,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const Text("Allow Screenshots"),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) => {},
                    ),
                    onTap: () {}),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
