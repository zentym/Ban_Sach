import 'package:ban_sach/model/GioHang.dart';
import 'package:ban_sach/pages/thongtin_sach.dart/book_controller.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:collection/collection.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({super.key});

  BookController get controller => Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            //Chiều ngang
            scrollDirection: Axis.vertical,

            controller: ScrollController(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Column(
                  children: [
                    //ảnh sách, tên sach,nhà xuất bản,bìa, tác giả, giá,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: NetworkImage(controller
                              .gioHang.value.sach.anh), //widget.sach!.anh
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ten: ${controller.gioHang.value.sach.ten}'),
                            Text(
                                'nhà xuất bản: ${controller.gioHang.value.sach.nhaxuatban}'),
                            Text('bìa: ${controller.gioHang.value.sach.bia}'),
                            Text(
                                'tác giả: ${controller.gioHang.value.sach.tacgia}'),
                            Text('giá: ${controller.gioHang.value.sach.gia} đ'),
                            Obx(
                              () => CounterButton(
                                loading: false,
                                onChange: (value) {
                                  controller.counter.value = value;
                                },
                                count: controller.counter.value,
                                countColor: Colors.purple,
                                buttonColor: Colors.purpleAccent,
                                progressColor: Colors.purpleAccent,
                              ),
                            )
                          ],
                        ),
                        //2 nút thêm vào giỏ, mua sách
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              //neu gio hang chua co sach cùng id thi them vao gio hang
                              if (controller.cartController.cartItems
                                      .firstWhereOrNull((element) =>
                                          element.id ==
                                          controller.gioHang.value.sach.id) ==
                                  null) {
                                controller.cartController.addToCart(
                                  controller.gioHang.value.sach,
                                  controller.counter.value,
                                );
                                print('1: ');
                                print(
                                    controller.cartController.totalItems.value);
                              }
                              //else {
                              //   controller.cartController.cartItems
                              //       .firstWhere((element) =>
                              //           element.sach.id ==
                              //           controller.gioHang.value.sach.id)
                              //       .soluong += controller.counter.value;
                              // }
                            },
                            child: const Text('Thêm vào giỏ hàng')),
                        ElevatedButton(
                            onPressed: () {
                              Get.snackbar(
                                  'Thông báo', 'Thêm vào giỏ hàng thành công');
                              Get.offAndToNamed('/giohang');
                            },
                            child: const Text('Mua sách')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
