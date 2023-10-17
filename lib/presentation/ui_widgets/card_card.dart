import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/jmm_forward_icon.dart';

class CardCard extends StatelessWidget {
  const CardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Contained(
      child: Card(
        shadowColor: Colors.purpleAccent,
        elevation: 2,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            // backgroundColor: MaterialStateProperty.all(Colors.white),
            //the style should be that on bottom, there is radius of 10 on bottomleft and bottomRight and on top 0
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          onPressed: () {
            //TODO: redirect to CardPage
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Contained(
                  child: Row(children: [
                    Expanded(
                      child: Text("Credit Card",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                    ),
                    Text(
                      "John Tester".toUpperCase().toString(),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ]),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Online Payments",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          Switch(value: true, onChanged: (bool state) {})
                        ]),
                    const Icon(
                      Icons.credit_card,
                      size: 140,
                    )
                  ],
                ),
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
