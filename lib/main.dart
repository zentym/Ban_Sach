import 'package:ban_sach/firebase/controller/cart.dart';
import 'package:ban_sach/firebase/controller/controller.dart';
import 'package:ban_sach/firebase/controller/firebase_constant.dart';
import 'package:ban_sach/firebase/services/firestore_db.dart';
import 'package:ban_sach/widgets/Login.dart';
import 'package:ban_sach/widgets/SignUp.dart';
import 'package:ban_sach/pages/admin_page.dart/admin_page.dart';
import 'package:ban_sach/widgets/card_info.dart';
import 'package:ban_sach/widgets/man_thanh_toan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDnHs5Cco3nZX7fTRhASr2XK3AG9Un1uyA",
    projectId: "bansach-5234f",
    messagingSenderId: "305020745497",
    appId: "1:305020745497:web:2a3eb490fc046cbeb37788",
    storageBucket: "bansach-5234f.appspot.com",
  ));

  Get.put(
    CartController(),
    permanent: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[400],
        iconTheme: const IconThemeData(color: Colors.green, opacity: 1),
        scaffoldBackgroundColor: const Color.fromARGB(255, 248, 250, 252),
      ),
      initialRoute: initScreen == 0 || initScreen == null ? '/intro' : '/',
      getPages: AppRoutes.routes(),
    );
  }
}
