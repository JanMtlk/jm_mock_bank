import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';

class BankingIdentityPage extends StatelessWidget {
  const BankingIdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banking Identity JMMB"),
      ),
      body: ListView(
        children: [
          Contained(
              child: Column(
            children: [
              Text(
                "Banking Identity JMMB",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.purple.shade900,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.info),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Your JMMB key is registered for authentication for JMMB digital services.",
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "Frequently asked questions",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              const ExpansionTile(
                  iconColor: Colors.purple,
                  collapsedIconColor: Colors.purple,
                  title: Text(
                      "What are the terms for Bank accepting Banking Identity?"),
                  children: [
                    Text(
                        "The terms for Bank accepting Banking Identity are as follows:"),
                    Text(
                        "1. You must be a registered user of JMMB digital services."),
                    Text(
                        "2. You must be a registered user of JMMB digital services."),
                    Text(
                        "3. You must be a registered user of JMMB digital services."),
                    Text(
                        "4. You must be a registered user of JMMB digital services."),
                  ]),
              const ExpansionTile(
                  iconColor: Colors.purple,
                  collapsedIconColor: Colors.purple,
                  title: Text("What is a JMMB key?"),
                  children: [
                    Text(
                        "A JMMB key is a unique identifier that is used to identify you when you use JMMB digital services. It is a 6 digit number that is generated by the JMMB key generator. It is unique to you and should not be shared with anyone."),
                  ]),
              const ExpansionTile(
                  iconColor: Colors.purple,
                  collapsedIconColor: Colors.purple,
                  title: Text("Can I turn on and off repeatedly my JMMB key?"),
                  children: [
                    Text(
                        "Yes, you can turn on and off your JMMB key as many times as you want. However, you should only turn on your JMMB key when you want to use JMMB digital services."),
                  ]),
              const ExpansionTile(
                  iconColor: Colors.purple,
                  collapsedIconColor: Colors.purple,
                  title: Text(
                      "What happens if I lose phone connected to JMMB key?"),
                  children: [
                    Text(
                        "If you lose your phone, you should contact JMMB immediately to deactivate your JMMB key. You can do this by calling 1-123-123-1234 or by visiting your nearest JMMB branch."),
                  ]),
            ],
          ))
        ],
      ),
    );
  }
}
