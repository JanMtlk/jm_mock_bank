import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/accounts/accounts_controller.dart';
import 'package:jm_mock_bank/presentation/core/universal/jmmb_loader.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/account_card.dart';
// import 'package:jm_mock_bank/presentation/ui_widgets/account_card.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Account"),
          ),
          body: GetBuilder<AccountsController>(builder: (controller) {
            if (controller.accountsState == AccountsState.loading) {
              return const Center(child: JMMBLoader());
            }
            return ListView(
              children: [
                AccountCard(
                    isSelected: true,
                    account: controller
                        .accountsList[controller.selectedAccountIndex]),

                // const AccountCard(),
                const TabBar(
                    isScrollable:
                        false, // make scrollable if there are more tabs, but as long as it does not extend to width of the screen it should be off
                    tabs: [
                      Tab(text: "History"),
                      Tab(text: "Products"),
                      Tab(text: "Detail"),
                    ]),
                SizedBox(
                  height: Get.size.height -
                      (kToolbarHeight + kBottomNavigationBarHeight + 30),
                  child: TabBarView(children: [
                    ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) => ListTile(
                        title: Text("Item $index"),
                      ),
                    ),
                    const Center(child: Text("Products")),
                    const Center(child: Text("detail")),
                  ]),
                ),
              ],
            );
          })),
    );
  }
}
