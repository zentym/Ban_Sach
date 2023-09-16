import 'package:ban_sach/firebase/controller/cart.dart';
import 'package:ban_sach/model/GioHang.dart';
import 'package:ban_sach/model/Sach.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  RxInt counter = 0.obs;
  late Rx<GioHang> gioHang;
  CartController cartController = Get.find<CartController>();
  @override
  void onInit() {
    // TODgO: implement onInit
    gioHang = GioHang(id: '0', soluong: 0, sach: Get.arguments).obs;

    gioHang.value.id = gioHang.value.sach.id;
    print('id: ${gioHang.value.id}');
    super.onInit();
  }
}
