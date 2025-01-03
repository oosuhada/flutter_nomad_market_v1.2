import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getAppConfig() async {
    final docSnapshot =
        await _firestore.collection('app_config').doc('settings').get();
    return docSnapshot.data() ?? {};
  }

  Future<void> updateUserSettings(
      String userId, Map<String, dynamic> settings) async {
    await _firestore
        .collection('user_settings')
        .doc(userId)
        .set(settings, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>> getUserSettings(String userId) async {
    final docSnapshot =
        await _firestore.collection('user_settings').doc(userId).get();
    return docSnapshot.data() ?? {};
  }
}
