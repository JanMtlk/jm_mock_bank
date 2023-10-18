import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/accounts/accounts_controller.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/account_card.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/card_card.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/offer_card.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountsController>(
      builder: (accountsController) => ListView(
        children: [
          for (var account in accountsController.accountsList)
            AccountCard(account: account),
          const OfferCard(),
          const CardCard(),
        ],
      ),
    );
  }
}
