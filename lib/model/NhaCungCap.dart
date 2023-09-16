//NhaCungCap có ten, email,sdt,diachi, id, hangnhap: HDNhap[]

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ban_sach/model/HDnhap.dart';

class NhaCungCap {
  late String id;
  late String ten;
  late String email;
  late String sdt;
  late String diachi;
  late List<HDNhap> hangnhap;
  NhaCungCap(
      {required this.id,
      required this.ten,
      required this.email,
      required this.sdt,
      required this.diachi,
      required this.hangnhap});
  NhaCungCap.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ten = json['ten'];
    email = json['email'];
    sdt = json['sdt'];
    diachi = json['diachi'];
    hangnhap = json['hangnhap'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ten': ten,
      'email': email,
      'sdt': sdt,
      'diachi': diachi,
      'hangnhap': hangnhap
    };
  }

  NhaCungCap.fromSnapshot(DocumentSnapshot json) {
    id = json.id;
    ten = json['ten'];
    email = json['email'];
    sdt = json['sdt'];
    diachi = json['diachi'];
    hangnhap = json['hangnhap'];
  }
  factory NhaCungCap.fromMap(Map<String, dynamic> json) => NhaCungCap(
      id: json["id"],
      ten: json["ten"],
      email: json["email"],
      sdt: json["sdt"],
      diachi: json["diachi"],
      hangnhap: json["hangnhap"]);
}
