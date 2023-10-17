import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/single_pages/new_payment_page.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';
import 'package:jm_mock_bank/utils/constants.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Contained(
          child: Text(
            'Favorite payments',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              for (int i = 0; i < 50; i++)
                const Card(
                  child: SizedBox(
                    height: 85,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 40,
                        ),
                        Text(
                          'Friend Johny',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
        Contained(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      leading: const Icon(Icons.qr_code_2_outlined),
                      title: const Text('QR payment'),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.description),
                      title: const Text('From Template'),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.published_with_changes_rounded),
                      title: const Text('To Own Account'),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => MyColors.brightPurpleBG),
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => MyColors.brightPurpleText),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const NewPaymentPage(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_right_alt_sharp),
                              SizedBox(
                                width: 5,
                              ),
                              Text('New payment'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Contained(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Contained(
                      child: Text(
                        "Other payment options",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    ListTile(
                      title: const Text('Create QR code'),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('JMMB exchage'),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Repeated payment'),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('SEPA payment'),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
