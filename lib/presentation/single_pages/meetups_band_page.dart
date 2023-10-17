import 'package:flutter/material.dart';

class MeetupsBankPage extends StatefulWidget {
  const MeetupsBankPage({super.key});

  @override
  State<MeetupsBankPage> createState() => _MeetupsBankPageState();
}

class _MeetupsBankPageState extends State<MeetupsBankPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meetups in Bank"),
        ),
        body: const Column(children: [
          TabBar(
            tabs: <Widget>[
              Tab(text: 'Upcoming'),
              Tab(text: 'History'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                // Your tab content for Tab 1
                Center(child: Text('Tab 1 Content')),
                // Your tab content for Tab 2
                Center(child: Text('Tab 2 Content')),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
