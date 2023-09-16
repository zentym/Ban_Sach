// GioHang model class gom co id, soluong, sach
import 'package:ban_sach/model/Sach.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GioHang {
  late String id;
  late int soluong;
  late Sach sach;

  GioHang({required this.id, required this.soluong, required this.sach});

  // GioHang.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   soluong = json['soluong'];
  //   sach = Sach.fromJson(json['sach']);
  // }

  // Map<String, dynamic> toJson() {
  //   return {'id': id, 'soluong': soluong, 'sach': sach.toJson()};
  // }

  // GioHang.fromSnapshot(DocumentSnapshot json) {
  //   id = json.id;
  //   soluong = json['soluong'];
  //   sach = Sach.fromSnapshot(json['sach']);
  // }
  // factory GioHang.fromMap(Map<String, dynamic> json) => GioHang(
  //     id: json["id"],
  //     soluong: json["soluong"],
  //     sach: Sach.fromMap(json["sach"]));
}
