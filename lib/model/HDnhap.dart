//class HDNhap gom id, ngay,sach, sl, nhanVien: NhanVien
import 'package:ban_sach/model/NhanVien.dart';
import 'package:ban_sach/model/Sach.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HDNhap {
  late String id;
  late DateTime ngay;
  late Sach sach;
  late int sl;
  late NhanVien nhanVien;
  HDNhap(
      {required this.id,
      required this.ngay,
      required this.sach,
      required this.sl,
      required this.nhanVien});
  HDNhap.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ngay = json['ngay'];
    sach = Sach.fromJson(json['sach']);
    sl = json['sl'];
    nhanVien = NhanVien.fromJson(json['nhanVien']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ngay': ngay,
      'sach': sach.toJson(),
      'sl': sl,
      'nhanVien': nhanVien.toJson()
    };
  }

  HDNhap.fromSnapshot(DocumentSnapshot json) {
    id = json.id;
    ngay = json['ngay'];
    sach = Sach.fromSnapshot(json['sach']);
    sl = json['sl'];
    nhanVien = NhanVien.fromSnapshot(json['nhanVien']);
  }
  factory HDNhap.fromMap(Map<String, dynamic> json) => HDNhap(
      id: json["id"],
      ngay: json["ngay"],
      sach: Sach.fromMap(json["sach"]),
      sl: json["sl"],
      nhanVien: NhanVien.fromMap(json["nhanVien"]));
}
