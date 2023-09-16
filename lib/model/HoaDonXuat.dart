//class HoaDonXuat có id, ngay, giohang: GioHang[], nhanVien: NhanVien
import 'package:ban_sach/model/GioHang.dart';
import 'package:ban_sach/model/NhanVien.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HoaDonXuat {
  late String id;
  late DateTime ngay;
  late List<GioHang> giohang;

  HoaDonXuat({
    required this.id,
    required this.ngay,
    required this.giohang,
  });
  HoaDonXuat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ngay = json['ngay'];
    giohang = json['giohang'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ngay': ngay,
      'giohang': giohang,
    };
  }

  HoaDonXuat.fromSnapshot(DocumentSnapshot json) {
    id = json.id;
    ngay = json['ngay'];
    giohang = json['giohang'];
  }
  factory HoaDonXuat.fromMap(Map<String, dynamic> json) => HoaDonXuat(
        id: json["id"],
        ngay: json["ngay"],
        giohang: json["giohang"],
      );
}
