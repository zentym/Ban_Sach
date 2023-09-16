import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/HDnhap.dart';
import 'firebase_constant.dart';

class HDNhapController extends GetxController {
  final allHDNhap = <HDNhap>[].obs;
  final showHDNhap = <HDNhap>[].obs;
  void onReady() async {
    showHDNhap.bindStream(lista());
    super.onReady();
  }

  Stream<List<HDNhap>> lista() {
    Stream<QuerySnapshot> stream = firestore.collection('HDNhap').snapshots();
    return stream
        .map((event) => event.docs.map((e) => HDNhap.fromSnapshot(e)).toList());
  }

  Future<void> addHDNhap() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('HDNhap').get();
      final HDNhapList =
          querySnapshot.docs.map((e) => HDNhap.fromSnapshot(e)).toList();
      allHDNhap.assignAll(HDNhapList);
      update();
    } catch (e) {
      print(e);
    }
  }

  late HDNhap HDNhapModel;
  Future<void> setHDNhap(HDNhap HDNhapModel) async {
    try {
      await firestore.collection('HDNhap').doc(HDNhapModel.id).set({
        //ngay, sach, sl, nhanvien
        'ngay': HDNhapModel.ngay,
        'sach': HDNhapModel.sach,
        'sl': HDNhapModel.sl,
        'nhanvien': HDNhapModel.nhanVien,
      });
      update();
    } catch (e) {
      print(e);
    }
  }
}
