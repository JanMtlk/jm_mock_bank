import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';

class ClubView extends StatefulWidget {
  const ClubView({super.key});

  @override
  State<ClubView> createState() => _ClubViewState();
}

class _ClubViewState extends State<ClubView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            hintText: "Search for Offer, Shop, category or other",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Contained(
            child: Column(
          children: [
            Row(
              children: [
                const Text("Coupons"),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Colors.purple),
                    ))
              ],
            ),
          ],
        )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const SizedBox(
              width: 10,
            ),
            for (int i = 0; i < 5; i++)
              const Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(Icons.card_giftcard_outlined),
                    // decoration: BoxDecoration(
                    //     image: const DecorationImage(
                    //         image: AssetImage("assets/images/offer1.png"))),
                  ),
                  Text("50% off"),
                  Text("on all products")
                ],
              ),
          ]),
        ),
        Contained(
            child: Column(
          children: [
            Row(
              children: [
                const Text("Electronics"),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Colors.purple),
                    ))
              ],
            ),
          ],
        )),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              const SizedBox(
                width: 10,
              ),
              for (int i = 0; i < 5; i++)
                const Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Icon(Icons.card_giftcard_outlined),
                      // decoration: BoxDecoration(
                      //     image: const DecorationImage(
                      //         image: AssetImage("assets/images/offer1.png"))),
                    ),
                    Text("50% off"),
                    Text("on all products")
                  ],
                ),
            ]),
          ),
        ),
        Contained(
            child: Column(
          children: [
            Row(
              children: [
                const Text("Food and groceries"),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Colors.purple),
                    ))
              ],
            ),
          ],
        )),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              const SizedBox(
                width: 10,
              ),
              for (int i = 0; i < 5; i++)
                const Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Icon(Icons.card_giftcard_outlined),
                      // decoration: BoxDecoration(
                      //     image: const DecorationImage(
                      //         image: AssetImage("assets/images/offer1.png"))),
                    ),
                    Text("50% off"),
                    Text("on all products")
                  ],
                ),
            ]),
          ),
        ),
        Contained(
            child: Column(
          children: [
            Row(
              children: [
                const Text("Travel"),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(color: Colors.purple),
                    ))
              ],
            ),
          ],
        )),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              const SizedBox(
                width: 10,
              ),
              for (int i = 0; i < 5; i++)
                const Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Icon(Icons.card_giftcard_outlined),
                      // decoration: BoxDecoration(
                      //     image: const DecorationImage(
                      //         image: AssetImage("assets/images/offer1.png"))),
                    ),
                    Text("50% off"),
                    Text("on all products")
                  ],
                ),
            ]),
          ),
        ),
      ],
    );
  }
}
