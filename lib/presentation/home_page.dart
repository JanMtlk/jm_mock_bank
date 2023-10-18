import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/home_page_views/club_view.dart';
import 'package:jm_mock_bank/presentation/home_page_views/home_page_view.dart';
import 'package:jm_mock_bank/presentation/home_page_views/menu_view.dart';
import 'package:jm_mock_bank/presentation/home_page_views/offers_view.dart';
import 'package:jm_mock_bank/presentation/home_page_views/payments_view.dart';
import 'package:jm_mock_bank/presentation/single_pages/approve_actions_page.dart';
import 'package:jm_mock_bank/presentation/profile_page.dart';

class HomePage extends StatefulWidget {
  final int startingIndex;
  const HomePage({super.key, this.startingIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.startingIndex;
    _tabController = TabController(
      length: 5, // Number of tabs
      vsync: this, // Add a TickerProvider
    );
    _tabController?.animateTo(widget.startingIndex);
  }

  @override
  void dispose() {
    _tabController
        ?.dispose(); // Dispose of the TabController to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(Icons.balance_sharp),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("John Tester"),
                  Text(
                    "Personal Mock Banking",
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ApproveActionsPage()));
                },
                icon: const Icon(Icons.key)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfilePage()));
                },
                icon: const Icon(Icons.manage_accounts))
          ],
        ),
        //Using tab View instead of page view because of the scrolling across multiple pages in the same tab
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: const [
              HomePageView(),
              PaymentsView(),
              OffersView(),
              ClubView(),
              MenuView()
            ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.purple,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              // animate tab bar from defaultTab bar to value
              _currentIndex = value;
              _tabController?.animateTo(
                value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows_sharp), label: "Payment"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Offers"),
            BottomNavigationBarItem(
                icon: Icon(Icons.discount_sharp), label: "JMMB Club"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_sharp), label: "meni"),
          ],
        ));
  }
}
