import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/Sach.dart';

//cardbook là thông tin sách có chứa tên sách, giá tiền, ảnh, viền đen, màu trắng,ảnh 300x300
class CardBook extends StatelessWidget {
  Sach? sach;
  CardBook({this.sach});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Image.network(
              sach!.anh,
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
            Text(
              sach!.ten,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${sach!.gia} đ',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
