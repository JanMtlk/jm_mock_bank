import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/new_payment_controller.dart';

class NewPaymentPage extends StatefulWidget {
  const NewPaymentPage({super.key});

  @override
  State<NewPaymentPage> createState() => _NewPaymentPageState();
}

class _NewPaymentPageState extends State<NewPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New payment'),
      ),
      body: GetBuilder<NewPaymentController>(
        builder: (controller) => ListView(
          children: [
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'From account',
              ),
              onChanged: (value) {
                controller.fromAccount = value;
                controller.update();
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'To account',
              ),
              onChanged: (value) {
                controller.toAccount = value;
                controller.update();
              },
            ),
            const SizedBox(height: 20),
            Slider(
              value: controller.amount,
              onChanged: (value) {
                controller.amount = value;
                controller.update();
              },
              min: 0,
              max: 1000,
              divisions: 100,
              label: controller.amount.toStringAsFixed(2),
            ),
            Text("Amount: ${controller.amount.toStringAsFixed(2)}"),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Message',
              ),
              onChanged: (value) {
                controller.message = value;
                controller.update();
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Repeat"),
                Switch(
                  value: controller.repeat,
                  onChanged: (value) {
                    controller.repeat = value;
                    controller.update();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text(controller.date == null
                  ? 'pick date'
                  : controller.date?.toIso8601String() ?? ''),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                ).then((value) {
                  controller.date = value;
                  controller.update();
                });
              },
            ),
            const SizedBox(height: 20),
            if (controller.errors.isNotEmpty)
              Column(
                children: [
                  const Text("Errors:"),
                  for (final error in controller.errors) Text(error),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.isValid
                  ? () {
                      controller.submit();
                    }
                  : null,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
