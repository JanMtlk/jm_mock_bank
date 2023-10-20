import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jm_mock_bank/application/state/accounts/accounts_controller.dart';

class AccountNewPaymentDetail extends StatelessWidget {
  final Account account;
  final Function? onClick;
  const AccountNewPaymentDetail(
      {super.key, required this.account, this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (onClick != null) {
          onClick!();
        }
      },
      title: Text(account.accountName),
      subtitle: Text(account.accountNumber),
      trailing: Text(
          "${account.accountBalance.toStringAsFixed(2)} ${account.accountCurrency.name}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
