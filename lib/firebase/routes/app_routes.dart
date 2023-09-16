import 'package:ban_sach/pages/admin_page.dart/admin_page.dart';
import 'package:ban_sach/pages/admin_page.dart/admin_pageController.dart';
import 'package:ban_sach/pages/thongtin_sach.dart/book_info.dart';

import 'package:get/get.dart';

import '../../pages/gd_chinh/gdchinh.dart';
import '../../pages/giohang,dart/giohang_page.dart';
import '../../pages/login_sigup/login_controller.dart';
import '../../pages/login_sigup/login_page.dart';
import '../../pages/login_sigup/signup_page.dart';
import '../../pages/login_sigup/singup_controller.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: '/',
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUpPage(),
          binding: SignUpBinding(),
        ),
        GetPage(name: '/GDChinh', page: () => GdChinh()),
        GetPage(
          name: '/chitietsach',
          page: () => const BookInfo(),
        ),
        GetPage(name: '/giohang', page: () => const GioHang()),
        GetPage(
            name: '/admin',
            page: () => const AdminPage(),
            binding: AdminPageBinding())
      ];
}
