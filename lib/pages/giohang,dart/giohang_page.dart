import 'package:ban_sach/firebase/controller/cart.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'giohang_controller.dart';

class GioHang extends StatelessWidget {
  const GioHang({super.key});

  GioHangController get controller => Get.put(GioHangController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: BackButton(
              onPressed: () => Get.toNamed('/GDChinh'),
            ),
          ),
          Expanded(
            child: Center(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      //anh, ten gia, button so luong, nut xoa
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(controller.cartController
                                .cartItems[index].anh), //widget.sach!.anh
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'ten: ${controller.cartController.cartItems[index].ten}'),
                              Text(
                                  'giá: ${controller.cartController.cartItems[index].gia} đ'),
                              Obx(
                                () => CounterButton(
                                  loading: false,
                                  onChange: (value) {
                                    controller.cartController.total[index] =
                                        value;
                                    controller.cartController.update();
                                    print(controller.cartController.total[index]
                                        .toString());
                                    controller.cartController.tinhtong();
                                  },
                                  count: controller.cartController.total[index],
                                  countColor: Colors.purple,
                                  buttonColor: Colors.purpleAccent,
                                  progressColor: Colors.purpleAccent,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.cartController.removeFromCart(
                                      controller
                                          .cartController.cartItems[index]);
                                },
                                child: const Text('Xóa'),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Obx(
            () => Text(
              'Tổng tiền: ${controller.cartController.tongtien.value}',
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
