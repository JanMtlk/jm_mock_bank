import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/accounts/accounts_controller.dart';
import 'package:jm_mock_bank/presentation/core/home_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/account_page.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/jmm_forward_icon.dart';
import 'package:jm_mock_bank/utils/constants.dart';
import 'package:logger/logger.dart';

class AccountCard extends StatelessWidget {
  final Account account;
  const AccountCard({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Contained(
      child: GestureDetector(
        onTap: () {
          Get.to(() => const AccountPage());
        },
        child: Card(
          shadowColor: Colors.purpleAccent,
          elevation: 2,
          child: Column(
            children: [
              Contained(
                child: Row(children: [
                  Expanded(
                    child: Text(
                      account.accountName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () {
                      // Copy text to clipboard
                      Clipboard.setData(
                          ClipboardData(text: account.accountName));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          showCloseIcon: true,
                          content: Text("Account number copied to clipboard"),
                        ),
                      );
                    },
                    child: Text(
                      account.accountNumber,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ),
                ]),
              ),
              Contained(
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        account.accountBalance.floor().toString(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: Text(
                          ",${(account.accountBalance % 1).toString().length > 3 ? (account.accountBalance % 1).toString().substring(2, 4) : "00"} ",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        account.accountCurrency.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.seven_k_plus_sharp),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => MyColors.brightPurpleBG),
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => MyColors.brightPurpleText),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_forward),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Payment'),
                          ],
                        ),
                        onPressed: () {
                          Logger().i("Payment button pressed");
                          Get.offAll(() => const HomePage(startingIndex: 1),
                              transition: Transition.fadeIn);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        child: const Row(
                          children: [
                            Icon(Icons.history),
                            SizedBox(
                              width: 5,
                            ),
                            Text('history'),
                          ],
                        ),
                        onPressed: () {
                          Get.to(() => const AccountPage());
                        },
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    // backgroundColor: MaterialStateProperty.all(Colors.white),
                    //the style should be that on bottom, there is radius of 10 on bottomleft and bottomRight and on top 0
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    //TODO: add redirect to OfferPage
                  },
                  child: const Contained(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Personalized offer with allowed overdraft \nup to 100 000 CZK",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ),
                          JmmForwardIcon(size: 20)
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
