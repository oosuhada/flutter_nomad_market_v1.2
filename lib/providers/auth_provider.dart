// lib/providers/auth_provider.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/entities/user.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<UserEntity?> build() async {
    return _userFromFirebase(FirebaseAuth.instance.currentUser);
  }

  UserEntity? _userFromFirebase(User? user) {
    if (user == null) return null;
    return UserEntity.fromFirebaseUser(user);
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      state = AsyncValue.data(_userFromFirebase(userCredential.user));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
