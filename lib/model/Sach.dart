// Sach co thuoc tinh: id, ten, nhaxuatban, bia, tacgia, gia, soluong, anh
// Sach co phuong thuc: inThongTinSach()
import 'package:cloud_firestore/cloud_firestore.dart';

class Sach {
  late String id;
  late String ten;
  late String nhaxuatban;
  late String bia;
  late String tacgia;
  late String gia;
  late String soluong;
  late String anh;
  Sach({
    required this.id,
    required this.ten,
    required this.nhaxuatban,
    required this.bia,
    required this.tacgia,
    required this.gia,
    required this.soluong,
    required this.anh,
  });
  Map<String, dynamic> toJson() {
    return {
      'ten': ten,
      'nhaxuatban': nhaxuatban,
      'bia': bia,
      'tacgia': tacgia,
      'gia': gia,
      'soluong': soluong,
      'anh': anh
    };
  }

  Sach.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    ten = json['ten'] ?? '';
    nhaxuatban = json['nhaxuatban'] ?? '';
    bia = json['bia'] ?? '';
    tacgia = json['tacgia'] ?? '';
    gia = json['gia'] ?? '';
    soluong = json['soluong'] ?? '';
    anh = json['anh'] ?? '';
  }
  factory Sach.fromSnapshot(DocumentSnapshot snapshot) {
    //vài thuộc tính có thể nulll
    Sach newSach = Sach.fromJson(snapshot.data() as Map<String, dynamic>);
    newSach.id = snapshot.id;
    return newSach;
  }

  factory Sach.fromMap(Map<String, dynamic> json) => Sach(
      id: json["id"],
      ten: json["ten"],
      nhaxuatban: json["nhaxuatban"],
      bia: json["bia"],
      tacgia: json["tacgia"],
      gia: json["gia"],
      soluong: json["soluong"],
      anh: json["anh"]);
  void inThongTinSach() {
    print('id: $id');
    print('ten: $ten');
    print('nhaxuatban: $nhaxuatban');
    print('bia: $bia');
    print('tacgia: $tacgia');
    print('gia: $gia');
    print('soluong: $soluong');
    print('anh: $anh');
  }
}
