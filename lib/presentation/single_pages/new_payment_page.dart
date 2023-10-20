import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jm_mock_bank/application/state/accounts/accounts_controller.dart';
import 'package:jm_mock_bank/application/state/new_payment_controller.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/account_new_payment_detail.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/contained.dart';
import 'package:jm_mock_bank/presentation/ui_widgets/jmm_forward_icon.dart';

class NewPaymentPage extends StatefulWidget {
  const NewPaymentPage({super.key});

  @override
  State<NewPaymentPage> createState() => _NewPaymentPageState();
}

class _NewPaymentPageState extends State<NewPaymentPage> {
  bool isFromAccountExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New payment'),
      ),
      body: GetBuilder<NewPaymentController>(
          builder: (newPaymentController) => Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Contained(
                            child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Contained(
                                child: Text("From Account",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ),
                              // select from accounts
                              //TODO: fix broken row
                              Row(
                                children: [
                                  Expanded(
                                    child: AccountNewPaymentDetail(
                                      account: Get.put(AccountsController())
                                              .accountsList[
                                          Get.put(AccountsController())
                                              .selectedAccountIndex],
                                      onClick: () {
                                        setState(() {
                                          isFromAccountExpanded =
                                              !isFromAccountExpanded;
                                        });
                                      },
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isFromAccountExpanded =
                                              !isFromAccountExpanded;
                                        });
                                      },
                                      icon: isFromAccountExpanded
                                          ? const JmmForwardIcon(
                                              isOppened: true,
                                            )
                                          : const JmmForwardIcon()),
                                ],
                              ),

                              isFromAccountExpanded
                                  ? SizedBox(
                                      height: Get.height / 2,
                                      child: ListView(children: [
                                        for (final account
                                            in Get.find<AccountsController>()
                                                .accountsList)
                                          account ==
                                                  Get.put(AccountsController())
                                                      .accountsList[Get.put(
                                                          AccountsController())
                                                      .selectedAccountIndex]
                                              ? const SizedBox.shrink()
                                              : AccountNewPaymentDetail(
                                                  account: account,
                                                  onClick: () {
                                                    Get.put(AccountsController())
                                                        .setSelectedAccountIndex(
                                                            Get.put(AccountsController())
                                                                .accountsList
                                                                .indexOf(
                                                                    account));
                                                    newPaymentController
                                                        .update();
                                                    setState(() {
                                                      isFromAccountExpanded =
                                                          !isFromAccountExpanded;
                                                    });
                                                  },
                                                ),
                                      ]),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        )),
                        Contained(
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Contained(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Receiver Account",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text("Choose receiver"))
                                    ],
                                  ),
                                ),
                                Contained(
                                  child: Row(
                                    children: [
                                      const Expanded(
                                          child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Prefix',
                                        ),
                                      )),
                                      Expanded(
                                          flex: 2,
                                          child: TextField(
                                            controller: newPaymentController
                                                .receiverAccountNumberController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Account number',
                                            ),
                                          )),
                                      Expanded(
                                          child: TextField(
                                        controller: newPaymentController
                                            .receiverAccountBankController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'bank',
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                )

                                // select from accounts
                              ],
                            ),
                          ),
                        ),
                        Contained(
                          child: Card(
                            child: Contained(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Amount'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '0.00',
                                          ),
                                          onTapOutside: (event) {
                                            newPaymentController
                                                .checkAmountValue();
                                            //remove focus
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                          },
                                          controller: newPaymentController
                                              .amountController,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            newPaymentController
                                                .checkAmountValue();
                                          },
                                        ),
                                      ),
                                      Text(Get.put(AccountsController())
                                          .accountsList[
                                              Get.put(AccountsController())
                                                  .selectedAccountIndex]
                                          .accountCurrency
                                          .name),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('Due date'),
                                  ElevatedButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            newPaymentController.dueDate == null
                                                ? 'Due date'
                                                : newPaymentController.dueDate
                                                        .toIso8601String()
                                                        .substring(0, 10) ??
                                                    ''),
                                        const Icon(Icons.calendar_today)
                                      ],
                                    ),
                                    onPressed: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(
                                            const Duration(days: 365 * 10)),
                                      ).then((value) {
                                        newPaymentController.dueDate =
                                            value ?? DateTime.now();
                                        newPaymentController.update();
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Variable symbol',
                                    ),
                                    controller: newPaymentController
                                        .variableSymbolController,
                                    keyboardType: TextInputType.number,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Constant symbol',
                                    ),
                                    controller: newPaymentController
                                        .constantSymbolController,
                                    keyboardType: TextInputType.number,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Specific symbol',
                                    ),
                                    controller: newPaymentController
                                        .specificSymbolController,
                                    keyboardType: TextInputType.number,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Receiver message',
                                    ),
                                    controller: newPaymentController
                                        .receiverMessageController,
                                    keyboardType: TextInputType.text,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Sender message',
                                    ),
                                    controller: newPaymentController
                                        .senderMessageController,
                                    keyboardType: TextInputType.text,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Repeat'),
                                      Switch(
                                        value: newPaymentController.repeat,
                                        onChanged: (value) {
                                          newPaymentController.repeat = value;
                                          newPaymentController.update();
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        // if (controller.errors.isNotEmpty) {
                        //   Column(
                        //     children: [
                        //       const Text("Errors:"),
                        //       for (final error in controller.errors) Text(error),
                        //     ],
                        //   )
                        // },
                        const SizedBox(height: 20),
                        //show errors
                        if (newPaymentController.errors.isNotEmpty)
                          Column(
                            children: [
                              const Text("Errors:"),
                              for (final error in newPaymentController.errors)
                                Text(error),
                            ],
                          ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: newPaymentController.isValid
                        ? () {
                            newPaymentController.submit();
                          }
                        : null,
                    child: const Text('Submit'),
                  ),
                ],
              )),
    );
  }
}
