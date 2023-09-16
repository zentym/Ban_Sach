//hiển thị danh sach Sach từ firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../firebase/controller/sach_controller.dart';
import '../../model/Sach.dart';

class GdChinh extends StatelessWidget {
  GdChinh({super.key});
  final controller = Get.put(SachController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () {
                //Error: Bad state: field does not exist within the DocumentSnapshotPlatform
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sách mới',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/giohang');
                            },
                            child: const Text('Giỏ hàng'),
                          ),
                        ],
                      ),
                    ),
                    //search

                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Tìm kiếm',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                        ),
                        onChanged: (value) {
                          controller.search(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: controller.showSach.isNotEmpty
                          ? GridView.builder(
                              itemCount: controller.showSach.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 0.7,
                              ),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/chitietsach',
                                          arguments: Sach(
                                            id: controller.showSach[index].id,
                                            ten: controller.showSach[index].ten,
                                            tacgia: controller
                                                .showSach[index].tacgia,
                                            gia: controller.showSach[index].gia,
                                            anh: controller.showSach[index].anh,
                                            bia: controller.showSach[index].bia,
                                            nhaxuatban: controller
                                                .showSach[index].nhaxuatban,
                                            soluong: controller
                                                .showSach[index].soluong,
                                          ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                              controller.showSach[index].anh,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            controller.showSach[index].ten,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${controller.showSach[index].gia} đ',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text('Không có sách nào'),
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
// GestureDetector(
//                     onTap: () {
//                       Get.toNamed('/chitietsach', arguments: {
//                         'id': controller.showSach()[index].id,
//                         'ten': controller.showSach()[index].ten,
//                         'tacgia': controller.showSach()[index].tacgia,
//                         'gia': controller.showSach()[index].gia,
//                         'hinhanh': controller.showSach()[index].hinhanh,
//                         'mota': controller.showSach()[index].mota,
//                         'soluong': controller.showSach()[index].soluong,
//                       });
//                     },
//                     );