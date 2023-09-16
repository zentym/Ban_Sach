//class KhachHang ke thua tu class ThanhVien,hoaDonXuat, sdt thuoc tich rieng, id, tk, mk ke thua tu class ThanhVien
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ThanhVien.dart';
import 'HoaDonXuat.dart';

class KhachHang {
  late String id;
  late String sdt;
  late String tk;
  late String mk;
  late List<HoaDonXuat> hoaDonXuat;
  KhachHang(
      {required this.id,
      required this.sdt,
      required this.tk,
      required this.mk,
      required this.hoaDonXuat});
  KhachHang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sdt = json['sdt'];
    tk = json['tk'];
    mk = json['mk'];
    hoaDonXuat = json['hoaDonXuat'];
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'sdt': sdt, 'tk': tk, 'mk': mk, 'hoaDonXuat': hoaDonXuat};
  }

  KhachHang.fromSnapshot(DocumentSnapshot json) {
    id = json.id;
    sdt = json['sdt'];
    tk = json['tk'];
    mk = json['mk'];
    hoaDonXuat = json['hoaDonXuat'];
  }
  factory KhachHang.fromMap(Map<String, dynamic> json) => KhachHang(
      id: json["id"],
      sdt: json["sdt"],
      tk: json["tk"],
      mk: json["mk"],
      hoaDonXuat: json["hoaDonXuat"]);
}
