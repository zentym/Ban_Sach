import 'package:ban_sach/model/HoaDonXuat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'firebase_constant.dart';

class HDonXuatController extends GetxController {
  final allHoaDonXuat = <HoaDonXuat>[].obs;
  final showHDonXuat = <HoaDonXuat>[].obs;

  @override
  void onReady() async {
    showHDonXuat.bindStream(lista());
    super.onReady();
  }

  Stream<List<HoaDonXuat>> lista() {
    Stream<QuerySnapshot> stream =
        firestore.collection('HoaDonXuat').snapshots();
    return stream.map(
        (event) => event.docs.map((e) => HoaDonXuat.fromSnapshot(e)).toList());
  }

  Future<void> addHoaDonXuat() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('HoaDonXuat').get();
      final HoaDonXuatList =
          querySnapshot.docs.map((e) => HoaDonXuat.fromSnapshot(e)).toList();
      allHoaDonXuat.assignAll(HoaDonXuatList);
      update();
    } catch (e) {
      print(e);
    }
  }

  late HoaDonXuat HoaDonXuatModel;

  Future<void> setHoaDonXuat(HoaDonXuat HoaDonXuatModel) async {
    try {
      await firestore.collection('HoaDonXuat').doc(HoaDonXuatModel.id).set({
        //ngay, giohang, nhanvien
        'ngay': HoaDonXuatModel.ngay,
        'giohang': HoaDonXuatModel.giohang,
        'date': DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
      });
      update();
    } catch (e) {
      print(e);
    }
  }
}
