import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/text_style.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '';
import 'login_controller.dart';
import 'singup_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // ShowPasswords get showPasswords => Get.find<ShowPasswords>();

  // EmailPassController get emailPassController => Get.find<EmailPassController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset(
                //   'assets/login_logo.png',
                //   width: 200,
                //   height: 200,
                // ),
                const Text(
                  'Đăng nhập để tiếp tục',
                  style: AppTextStyle.textStyle3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                AppTextField(
                  labelText: 'Email',
                  hintText: 'Nhập E-mail',
                  controller: Get.find<AppAuthController>().emailController,
                  textInputAction: TextInputAction.done,
                  // onSubmitted: (email) {
                  //   EmailPassController().emailController.text;
                  // },
                ),
                Obx(
                  () => AppTextField(
                    obscureText: Get.find<ShowPasswords>().obscureText.value,
                    hintText: 'Nhập mật khẩu',
                    labelText: 'Mật khẩu',
                    controller:
                        Get.find<AppAuthController>().passwordController,
                    // onSubmitted: (password){EmailPassController().passwordController.text;},
                    textInputAction: TextInputAction.done,
                    suffixIcon: IconButton(
                      icon: Icon(Get.find<ShowPasswords>().obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => Get.find<ShowPasswords>().changeState(),
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'Ghi nhớ tài khoản',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  onPressed: () {
                    Get.find<AppAuthController>().login();
                  },
                  text: 'Đăng nhập',
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Chưa có tài khoản? ',
                        style: AppTextStyle.textStyle2,
                      ),
                      TextSpan(
                        text: 'Đăng ký',
                        style: AppTextStyle.textStyle2Green,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed('/signup'); // Single tapped.
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
