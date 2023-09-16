//class ThanhVien gom co id(private), tk, mk(protected)
import 'package:cloud_firestore/cloud_firestore.dart';

class ThanhVien {
  late String id;
  late String tk;
  late String mk;
  ThanhVien({required this.id, required this.tk, required this.mk});
  ThanhVien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tk = json['tk'];
    mk = json['mk'];
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'tk': tk, 'mk': mk};
  }

  ThanhVien.fromSnapshot(DocumentSnapshot json) {
    id = json.id;
    tk = json['tk'];
    mk = json['mk'];
  }
  factory ThanhVien.fromMap(Map<String, dynamic> json) =>
      ThanhVien(id: json["id"], tk: json["tk"], mk: json["mk"]);
}
