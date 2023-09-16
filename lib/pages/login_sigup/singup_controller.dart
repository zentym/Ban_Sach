import 'package:get/get.dart';

import 'login_controller.dart';

class ShowPasswords extends GetxController {
  RxBool obscureText = true.obs;
  void changeState() {
    obscureText.value = !obscureText.value;
  }
}

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowPasswords());
    Get.lazyPut<AppAuthController>(() => AppAuthController());
    // TODO: implement dependencies
  }
}
