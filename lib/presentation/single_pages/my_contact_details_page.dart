import 'package:flutter/material.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';

class MyContactDetailsPage extends StatelessWidget {
  const MyContactDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Details"),
      ),
      body: ListView(children: [
        Contained(
          child: Text(
            "Contact Details",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Contained(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Phone Number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              GestureDetector(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("+123 123 456 789"),
                    Icon(Icons.edit),
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
              const Text("Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              GestureDetector(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("john.tester@test.com"),
                    Icon(Icons.edit),
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
              Text("Email", style: Theme.of(context).textTheme.bodyLarge),
              GestureDetector(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("john.tester@test.com"),
                    Icon(Icons.edit),
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
              const Text("Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              GestureDetector(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Street 123"),
                        Text("City"),
                        Text("Country"),
                      ],
                    ),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
