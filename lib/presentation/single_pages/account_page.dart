import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/account_card.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Account"),
          ),
          body: ListView(
            children: [
              const AccountCard(),
              const TabBar(isScrollable: true, tabs: [
                Tab(text: "Overview"),
                Tab(text: "Transactions"),
                Tab(text: "Cards"),
                Tab(text: "Settings"),
                Tab(text: "Settings22"),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    (kToolbarHeight + kBottomNavigationBarHeight + 30),
                child: TabBarView(children: [
                  ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) => ListTile(
                      title: Text("Item $index"),
                    ),
                  ),
                  const Center(child: Text("Transactions")),
                  const Center(child: Text("Cards")),
                  const Center(child: Text("Settings")),
                  const Center(child: Text("Settings22")),
                ]),
              ),
            ],
          )),
    );
  }
}
