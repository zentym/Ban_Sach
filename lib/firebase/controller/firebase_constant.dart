import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseDatabase database = FirebaseDatabase.instance;
FirebaseApp firebaseApp = Firebase.app();

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
DatabaseReference ref = FirebaseDatabase.instance.ref();
final storage = FirebaseStorage.instance;
final storageRef = FirebaseStorage.instance.ref();

final userRef = firestore.collection('users');
final chiTieuRef = firestore.collection('ChiTieu');
final chiTieuThangRef = firestore.collection('ChiTieuThang');