import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';

class ClientNumberPage extends StatelessWidget {
  const ClientNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Client Number"),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Contained(
                    child: Text(
                  "your client number for Logging in \n the Online Banking is:",
                  textAlign: TextAlign.center,
                )),
                Text(
                  "123456789",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            )),
          ),
          Contained(
              child: ElevatedButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
        ],
      ),
    );
  }
}
