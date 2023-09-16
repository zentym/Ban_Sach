import 'package:ban_sach/constant/text_style.dart';
import 'package:ban_sach/pages/login_sigup/singup_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import 'login_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  ShowPasswords get showPasswords => Get.find<ShowPasswords>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Text(
                  'TẠO TÀI KHOẢN',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Vui lòng nhập thông tin bên dưới',
                  style: AppTextStyle.textStyle2,
                ),
                const SizedBox(height: 32),
                AppTextField(
                  hintText: 'Nhập địa chỉ E-mail',
                  labelText: 'Địa chỉ E-mail',
                  controller: Get.find<AppAuthController>().emailController,
                ),
                Obx(
                  () => AppTextField(
                    obscureText: showPasswords.obscureText.value,
                    hintText: 'Nhập mật khẩu',
                    labelText: 'Mật khẩu',
                    controller:
                        Get.find<AppAuthController>().passwordController,
                    suffixIcon: IconButton(
                      icon: Icon(showPasswords.obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => showPasswords.changeState(),
                    ),
                  ),
                ),
                const SizedBox(height: 24 - 16),
                AppButton(
                  onPressed: () => {
                    Get.find<AppAuthController>().register(),
                  },
                  text: 'Đăng ký',
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Đã có tài khoản? ',
                        style: AppTextStyle.textStyle2,
                      ),
                      TextSpan(
                        text: 'Đăng nhập',
                        style: AppTextStyle.textStyle2Green,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed('/'); // Single tapped.
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
