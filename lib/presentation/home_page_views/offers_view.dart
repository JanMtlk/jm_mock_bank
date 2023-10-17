import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/jmm_forward_icon.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Contained(
          child: Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Contained(
                child: Text(
                  "Offers",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text("Loans and mortgage"),
                leading: Icon(Icons.attach_money_outlined),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text("Cards"),
                leading: Icon(Icons.credit_card_sharp),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text("Accounts and savings"),
                leading: Icon(Icons.wallet),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text("Investments"),
                leading: Icon(Icons.auto_graph_sharp),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text("Insurance"),
                leading: Icon(Icons.shield_outlined),
                trailing: JmmForwardIcon(),
              ),
              const ListTile(
                title: Text("Tips and tricks"),
                leading: Icon(Icons.lightbulb),
                trailing: JmmForwardIcon(),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
        )
      ],
    );
  }
}
