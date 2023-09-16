//class NhanVien gom id, vitri ke thua tu class ThanhVien
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ThanhVien.dart';

class NhanVien extends ThanhVien {
  late String id;
  late String vitri;
  late String tk;
  late String mk;
  NhanVien(
      {required this.id,
      required this.vitri,
      required this.tk,
      required this.mk})
      : super(id: id, tk: tk, mk: mk);
  Map<String, dynamic> toJson() {
    return {'id': id, 'vitri': vitri, 'tk': tk, 'mk': mk};
  }

  NhanVien.fromJson(Map<String, dynamic> json)
      : super(id: json['id'], tk: json['tk'], mk: json['mk']) {
    id = json['id'];
    vitri = json['vitri'];
    tk = json['tk'];
    mk = json['mk'];
  }
  NhanVien.fromSnapshot(DocumentSnapshot json)
      : super(id: json['id'], tk: json['tk'], mk: json['mk']) {
    id = json.id;
    vitri = json['vitri'];
    tk = json['tk'];
    mk = json['mk'];
  }
  factory NhanVien.fromMap(Map<String, dynamic> json) => NhanVien(
      id: json["id"], vitri: json["vitri"], tk: json["tk"], mk: json["mk"]);
}
