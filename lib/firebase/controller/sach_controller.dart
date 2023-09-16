import 'package:flutter/widgets.dart';

import '../../model/Sach.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_constant.dart';

class SachController extends GetxController {
  final showSach = <Sach>[].obs;
  final save = <Sach>[].obs;
  @override
  void onInit() async {
    showSach.bindStream(lista());
    super.onInit();
  }

  Stream<List<Sach>> lista() {
    Stream<QuerySnapshot> stream = firestore.collection('Sach').snapshots();
    return stream
        .map((event) => event.docs.map((e) => Sach.fromSnapshot(e)).toList());
  }

  //searchController
  final searchController = TextEditingController();
  Future<void> search(value) async {
    if (save.length < showSach.length) {
      save.assignAll(showSach);
    }

    if (value == '' || value == null) {
      showSach.assignAll(save);
    } else {
      var sach = save.where((element) => element.ten.contains(value)).toList();
      showSach.assignAll(sach);
    }
    // if (value == '') {
    //   showSach.assignAll(showSach);
    // } else {
    //   var sach =
    //       showSach.where((element) => element.ten.contains(value)).toList();
    //   showSach.assignAll(sach);
    // }
  }

  // Future<void> addSach() async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await firestore.collection('sach').get();

  //     final sachList =
  //         querySnapshot.docs.map((e) => Sach.fromSnapshot(e)).toList();

  //     allSach.assignAll(sachList);
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  late Sach sachModel;

  Future<void> setSach(Sach sachModel) async {
    try {
      await firestore.collection('Sach').doc(sachModel.id).set({
        'ten': sachModel.ten,
        'nhaxuatban': sachModel.nhaxuatban,
        'bia': sachModel.bia,
        'tacgia': sachModel.tacgia,
        'gia': sachModel.gia,
        'soluong': sachModel.soluong,
        'anh': sachModel.anh,
      });
      update();
    } catch (e) {
      print(e);
    }
  }
}
