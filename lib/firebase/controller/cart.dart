import 'package:ban_sach/model/Sach.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Sach>[].obs;
  RxList<int> total = <int>[].obs;
  var totalItems = 0.obs;
  var tongtien = 0.obs;
  addToCart(Sach item, int sl) {
    cartItems.add(item);
    total.add(sl);
    totalItems.value += 1;
    tinhtong();
    // tongtien.value += int.parse(item.gia) * sl;
  }

  removeFromCart(Sach item) {
    tongtien.value -= int.parse(item.gia) * total[cartItems.indexOf(item)];
    cartItems.remove(item);
    totalItems.value -= 1;
    total.removeAt(cartItems.indexOf(item));
  }

  clearCart() {
    cartItems.clear();
    total.clear();
    totalItems.value = 0;
    tongtien.value = 0;
  }

  tinhtong() {
    tongtien.value = 0;
    for (int i = 0; i < cartItems.length; i++) {
      tongtien.value += int.parse(cartItems[i].gia) * total[i];
    }
  }
}
