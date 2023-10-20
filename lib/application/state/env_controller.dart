import 'package:get/get.dart';

enum Environment { dev, prod }

class EnvController extends GetxController {
  Environment env = Environment.dev;
  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() {
    env = Environment.dev;
    update();
  }
}
