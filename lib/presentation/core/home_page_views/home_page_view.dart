import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/account_card.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/card_card.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/offer_card.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AccountCard(),
        OfferCard(),
        CardCard(),
      ],
    );
  }
}
