import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NewPaymentController extends GetxController {
  String fromAccount = "";
  String toAccount = "";
  double amount = 0;
  String message = "";
  DateTime? date = DateTime.now();
  bool repeat = false;
  bool get isValid =>
      fromAccount.isNotEmpty &&
      toAccount.isNotEmpty &&
      amount != 0 &&
      message.isNotEmpty &&
      date != null;
  List<String> get errors {
    final List<String> errors = [];
    if (fromAccount.isEmpty) {
      errors.add("From account is empty");
    }
    if (toAccount.isEmpty) {
      errors.add("To account is empty");
    }
    if (amount == 0) {
      errors.add("Amount is 0");
    }
    if (message.isEmpty) {
      errors.add("Message is empty");
    }
    if (date == null) {
      errors.add("Date is empty");
    }
    return errors;
  }

  void submit() {}
}
