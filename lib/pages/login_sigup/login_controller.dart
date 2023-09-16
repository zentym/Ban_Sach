import 'package:ban_sach/firebase/controller/firebase_constant.dart';
import 'package:ban_sach/model/ThanhVien.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../firebase/controller/controller.dart';
import '../../widgets/dialog.dart';
import 'singup_controller.dart';

class CheckBoxLoginController extends GetxController {
  RxBool checkBoxVal = false.obs;

  void onChanged(bool val) {
    checkBoxVal.value = val;
  }
}

class AppAuthController extends GetxController {
  final allUser = <ThanhVien>[].obs;
  @override
  void onInit() {
    if (auth.currentUser != null) {
      Get.offAndToNamed('/GDChinh');
    }
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Rx<Map<String, dynamic>> db;
  void login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAndToNamed('/GDChinh');

      // var showUid = auth.currentUser!.uid;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-email' || e.code == 'user-not-found') {
        Get.dialog(
          AppAlertDialog(
            title: 'LỖI',
            content: 'Không tìm thấy người dùng, vui lòng thử lại',
            textButton: 'ĐÓNG',
            onPressed: () => Get.back(),
          ),
        );

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.dialog(
          AppAlertDialog(
            title: 'LỖI',
            content: 'Mật khẩu không trùng với thông tin đăng ký',
            textButton: 'ĐÓNG',
            onPressed: () => Get.back(),
          ),
        );

        print('Wrong password provided for that user.');
      }
    }
    //đợi 5s
    await Future.delayed(Duration(seconds: 5));
    if (auth.currentUser != null) {
      print('login success');
      Get.offAndToNamed('/GDChinh');
    }
    //có lỗi thi ko chuyển trang
    // if (auth.currentUser == null) {
    //   Get.toNamed('/');
    // }
  }

  void register() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        firestore.collection('users').doc(_userId).set({
          'email': emailController.text,
        });
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);

      Get.dialog(
        AppAlertDialog(
          title: 'LỖI',
          content: 'Mật khẩu hoặc tài khoản không hợp lệ hoặc đã tồn tại',
          textButton: 'ĐÓNG',
          onPressed: () => Get.back(),
        ),
      );
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.toNamed('/');
  }
}

class LoginButtonController extends GetxController {}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowPasswords>(() => ShowPasswords());
    Get.lazyPut<CheckBoxLoginController>(() => CheckBoxLoginController());
    Get.lazyPut<AppAuthController>(() => AppAuthController());
    Get.lazyPut<LoginButtonController>(() => LoginButtonController());
    Get.lazyPut(() => AuthController());
    // TODO: implement dependencies
  }
}
