import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NewPaymentController extends GetxController {
  //fromAccount is the one selected in account controller

  final TextEditingController receiverAccountPrefixController =
      TextEditingController();
  final TextEditingController receiverAccountNumberController =
      TextEditingController();
  final TextEditingController receiverAccountBankController =
      TextEditingController();
  final TextEditingController amountController = TextEditingController();

  DateTime dueDate = DateTime.now();
  final TextEditingController variableSymbolController =
      TextEditingController();
  final TextEditingController constantSymbolController =
      TextEditingController();
  final TextEditingController specificSymbolController =
      TextEditingController();
  final TextEditingController receiverMessageController =
      TextEditingController();
  final TextEditingController senderMessageController = TextEditingController();

  bool repeat = false;
  bool get isValid => true;
  // receiverAccountNumberController.text.isNotEmpty &&
  // amountController.text.isNotEmpty &&
  // message.isNotEmpty;

  List<String> get errors {
    final List<String> errors = [];
    if (receiverAccountNumberController.text.isEmpty) {
      errors.add("To account is empty");
    }
    if (amountController.text.isEmpty) {
      errors.add("Amount is 0");
    }
    if (receiverMessageController.text.isEmpty) {
      errors.add("Message is empty");
    }

    return errors;
  }

  void submit() {
    //TODO: submit payment
  }
  bool checkIntValid(String input) {
    if (int.tryParse(input) == null) {
      return false;
    }
    return true;
  }

  void checkAmountValue() {
    //regex should be that the value can be long as it wants, and there should be no comma, but there can be one dot. There can only be 2 places after the dot
    String newAmount = amountController.text;
    newAmount = newAmount.replaceAll(",", "");
    newAmount = newAmount.replaceAll(" ", "");

    // check dots
    newAmount = cropToTwoDecimalPlaces(newAmount);
    while (double.tryParse(newAmount) == null && newAmount.isNotEmpty) {
      newAmount = newAmount.substring(0, newAmount.length - 1);
    }
    amountController.text = newAmount;
    update();
  }

  String cropToTwoDecimalPlaces(String inputAmount) {
    // Check if the input contains a dot
    int firstDotPlace = inputAmount.indexOf(".");

    // If no dot is found, return the input as is
    if (firstDotPlace == -1) {
      return inputAmount;
    }

    // Check if there are more than 2 decimal places
    int endIndex = firstDotPlace + 3;
    if (endIndex < inputAmount.length) {
      // Crop to two decimal places
      return inputAmount.substring(0, endIndex);
    }

    return inputAmount;
  }
}
