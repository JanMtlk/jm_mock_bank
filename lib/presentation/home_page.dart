import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/single_pages/approve_actions_page.dart';
import 'package:jm_mock_bank/presentation/profile_page.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/account_card.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/card_card.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/offer_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.balance_sharp),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("John Tester"),
                Text(
                  "Personal Mock Banking",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ApproveActionsPage()));
              },
              icon: const Icon(Icons.key)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfilePage()));
              },
              icon: const Icon(Icons.manage_accounts))
        ],
      ),
      body: ListView(
        children: const [
          AccountCard(),
          OfferCard(),
          CardCard(),
        ],
      ),
    );
  }
}
