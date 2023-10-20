import 'package:get/get.dart';

//this controller serves as pointers to which Account
// is selected for payment or for show in AccountPage
class SelectedAccountController extends GetxController {
  int selectedAccountIndex = 0;

  void setSelectedAccountIndex(int index) {
    selectedAccountIndex = index;
    update();
  }
}
