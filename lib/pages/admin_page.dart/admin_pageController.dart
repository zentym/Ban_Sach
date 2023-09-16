import 'package:ban_sach/firebase/controller/firebase_constant.dart';
import 'package:ban_sach/firebase/controller/sach_controller.dart';
import 'package:ban_sach/model/Sach.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AdminPageController extends GetxController {
  SachController sachController = Get.find<SachController>();
  TextEditingController tenSachController = TextEditingController();
  TextEditingController nxbController = TextEditingController();
  TextEditingController biaController = TextEditingController();
  TextEditingController giaController = TextEditingController();
  TextEditingController soLuongController = TextEditingController();
  TextEditingController tacGiaController = TextEditingController();
  //ảnh controller
  TextEditingController anhController = TextEditingController();
  void onInit() {
    super.onInit();
  }

  void onReady() {
    super.onReady();
  }

  late Sach sachModel;
  Future setSach(Sach sachModel) async {
    try {
      await firestore
          .collection('sach')
          .doc(sachModel.id)
          .set(sachModel.toJson());
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> set(String ten, nxb, bia, tacgia, gia, sl, image) async {
    String id = '${sachController.showSach().length + 1}';
    //set cho sach
    try {
      await SachController().setSach(
        Sach(
            id: id,
            ten: ten,
            nhaxuatban: nxb,
            bia: bia,
            tacgia: tacgia,
            gia: gia,
            soluong: sl,
            anh: image),
      );
      update();
    } catch (e) {
      print(e);
    }
  }
}

Future<void> delete(String id) async {
  try {
    await firestore.collection('sach').doc(id).delete();
  } catch (e) {
    print(e);
  }
}

class AdminPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminPageController());
    Get.lazyPut(() => SachController());
  }
}
