import 'package:flutter/material.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Documents"),
        ),
        body: const Column(children: [
          TabBar(
            tabs: <Widget>[
              Tab(text: 'From Bank'),
              Tab(text: 'Uploaded by Me'),
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
