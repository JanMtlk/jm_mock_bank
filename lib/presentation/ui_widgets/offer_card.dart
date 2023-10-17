import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';
import 'package:jm_mock_bank/utils/constants.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Contained(
      child: Card(
        shadowColor: Colors.purpleAccent,
        elevation: 2,
        child: Column(
          children: [
            Container(
              child: const Contained(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    child: Text(
                      "Minute loan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              child: Contained(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        """We offer you a loan of 
up to 100 000 CZK with a maturity of up to 12 months. 
Pay off your loan at any time without any fees.""",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
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
                                Text('I am interested'),
                              ],
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            child: const Row(
                              children: [
                                Text('Close'),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
