// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

class AccountsController extends GetxController {
  AccountsState accountsState = AccountsState.initial;
  List<Account> accountsList = [];
  int selectedAccountIndex = 0;
  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() async {
    // Logger().i("accounts init");
    accountsState = AccountsState.loading;
    update();
    // Delayed
    await Future.delayed(const Duration(seconds: 1), () {
      accountsList = [
        Account(
          accountName: "Savings account",
          accountNumber: "1234567890",
          accountType: AccountType.savings,
          accountBalance: 1234.45,
          accountCurrency: AccountCurrency.CZK,
          accountStatus: AccountStatus.active,
          accountBranch: "Brno",
        ),
        Account(
          accountName: "Current account",
          accountNumber: "1234567890",
          accountType: AccountType.current,
          accountBalance: 45023,
          accountCurrency: AccountCurrency.CZK,
          accountStatus: AccountStatus.active,
          accountBranch: "Brno",
        ),
      ];
      //place for logic to get the main account that user uses for payments when he goes straight into payments
      selectedAccountIndex = 0;
      accountsState = AccountsState.loaded;

      update();
      // Logger().i("new auth state ${accountsState.runtimeType}");
    });
  }

  void setSelectedAccountIndex(int indexOf) {
    // Logger().i("setSelectedAccountIndex $indexOf");
    selectedAccountIndex = indexOf;
    update();
  }
}

class Account {
  final String accountName;
  final String accountNumber;
  final AccountType accountType;
  final double accountBalance;
  final AccountCurrency accountCurrency;
  final AccountStatus accountStatus;
  final String accountBranch;

  Account({
    this.accountName = "",
    this.accountNumber = "",
    this.accountType = AccountType.basic,
    this.accountBalance = 1234.45,
    this.accountCurrency = AccountCurrency.CZK,
    this.accountStatus = AccountStatus.active,
    this.accountBranch = "",
  });
}

enum AccountsState {
  initial,
  loading,
  loaded,
  error,
}

enum AccountType {
  basic,
  savings,
  current,
  joint,
  business,
}

enum AccountCurrency {
  CZK,
  EUR,
  USD,
  GBP,
  CHF,
}

enum AccountStatus {
  active,
  inactive,
  pending,
  closed,
  blocked,
}
