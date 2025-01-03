import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../models/components/entities/user.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Future<User?> getUserById(String id) async {
    final docSnapshot = await _firestore.collection('users').doc(id).get();
    return docSnapshot.data() != null
        ? User.fromJson(docSnapshot.data()!)
        : null;
  }

  Future<User> createUser(User user) async {
    final auth.UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    final uid = userCredential.user!.uid;
    await _firestore.collection('users').doc(uid).set(user.toJson());
    return user.copyWith(id: uid);
  }

  Future<void> updateUser(User user) async {
    await _firestore
        .collection('users')
        .doc(user.id as String?)
        .update(user.toJson());
  }

  Future<bool> verifyUser(String userId, String verificationType) async {
    await _firestore.collection('user_verifications').add({
      'user_id': userId,
      'verification_type': verificationType,
      'status': 'pending',
      'created_at': FieldValue.serverTimestamp(),
    });
    return true;
  }

  Future<double> getUserReputationScore(String userId) async {
    final docSnapshot = await _firestore.collection('users').doc(userId).get();
    return docSnapshot.data()?['reputation_score'] ?? 0.0;
  }
}
