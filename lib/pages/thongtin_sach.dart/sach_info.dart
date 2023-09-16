import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../model/Sach.dart';

class SachInfo2 extends StatefulWidget {
  late final Sach? sach;
  late final int _counter;
  SachInfo2({super.key, this.sach});

  @override
  State<SachInfo2> createState() => _SachInfo2State();
}

class _SachInfo2State extends State<SachInfo2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.sach = Get.arguments;
    widget._counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          //Chiều ngang
          scrollDirection: Axis.horizontal,
          controller: ScrollController(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //ảnh sách, tên sach,nhà xuất bản,bìa, tác giả, giá,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: NetworkImage(widget.sach!.anh), //widget.sach!.anh
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ten: ${widget.sach!.ten}'),
                        Text('nhà xuất bản: ${widget.sach!.nhaxuatban}'),
                        Text('bìa: ${widget.sach!.bia}'),
                        Text('tác giả: ${widget.sach!.tacgia}'),
                        Text('giá: ${widget.sach!.gia} đ'),
                        CounterButton(
                          loading: false,
                          onChange: (value) {
                            print(value);
                            widget._counter = value;
                            setState(() {});
                          },
                          count: widget._counter,
                          countColor: Colors.purple,
                          buttonColor: Colors.purpleAccent,
                          progressColor: Colors.purpleAccent,
                        ),
                      ],
                    ),
                    //2 nút thêm vào giỏ, mua sách
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Text('Thêm vào giỏ hàng')),
                    ElevatedButton(onPressed: () {}, child: Text('Mua sách')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// //ảnh sách, tên sach,nhà xuất bản,bìa, tác giả, giá, nút mua sách, nút thêm giỏ hàng
// class SachInfo extends StatelessWidget {
//   late Sach sach;
//   int _counter = 0;

//   SachInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print(Get.arguments);
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           //Chiều ngang
//           scrollDirection: Axis.horizontal,
//           controller: ScrollController(),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: [
//                 //ảnh sách, tên sach,nhà xuất bản,bìa, tác giả, giá,
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image(
//                       image: NetworkImage(sach.anh),
//                       width: 300,
//                       height: 400,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('ten: ${sach.ten}'),
//                         Text('nhà xuất bản: ${sach.nhaxuatban}'),
//                         Text('bìa: ${sach.bia}'),
//                         Text('tác giả: ${sach.tacgia}'),
//                         Text('giá: ${sach.gia} đ'),
//                         CounterButton(
//                           loading: false,
//                           onChange: (value) {
//                             print(value);
//                             _counter = value;
//                           },
//                           count: _counter,
//                           countColor: Colors.purple,
//                           buttonColor: Colors.purpleAccent,
//                           progressColor: Colors.purpleAccent,
//                         ),
//                       ],
//                     ),
//                     //2 nút thêm vào giỏ, mua sách
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: () {}, child: Text('Thêm vào giỏ hàng')),
//                     ElevatedButton(onPressed: () {}, child: Text('Mua sách')),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
