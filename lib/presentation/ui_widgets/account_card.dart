import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/presentation/core/home_page.dart';
import 'package:jm_mock_bank/presentation/single_pages/account_page.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/jmm_forward_icon.dart';
import 'package:jm_mock_bank/utils/constants.dart';
import 'package:logger/logger.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

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
                  const Expanded(
                    child: Text(
                      "Basic personal account",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () {
                      // Copy text to clipboard
                      String text = "1234567891/1234";
                      Clipboard.setData(ClipboardData(text: text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          showCloseIcon: true,
                          content: Text("Account number copied to clipboard"),
                        ),
                      );
                    },
                    child: const Text(
                      "1234567891/1234",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ),
                ]),
              ),
              Contained(
                child: Column(children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "2 312",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: Text(
                          ",40",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "CZK",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.seven_k_plus_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
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
