import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AppRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> initializeApp() async {
    await Firebase.initializeApp();
  }

  Future<String> getAppVersion() async {
    final docSnapshot =
        await _firestore.collection('app_config').doc('version').get();
    return docSnapshot.data()?['version'] ?? '1.0.0';
  }

  Future<void> updateAppSettings(Map<String, dynamic> settings) async {
    await _firestore
        .collection('app_config')
        .doc('settings')
        .set(settings, SetOptions(merge: true));
  }
}
