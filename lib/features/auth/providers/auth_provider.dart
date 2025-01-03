import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nomadmarket/features/auth/providers/auth_repository_provider.dart';
import 'package:nomadmarket/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  final _storage = const FlutterSecureStorage();
  final _auth = FirebaseAuth.instance;
  final _tokenValidityDuration = const Duration(days: 30);
  late final AuthRepository _repository = ref.read(authRepositoryProvider);

  @override
  Stream<User?> build() {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      return await _repository.signInWithEmail(email, password);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<User?> signInWithSocial(String provider) async {
    try {
      return await _repository.signInWithSocialProvider(provider);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<User?> _getUserFromToken(String token) async {
    try {
      final tokenTimestamp = await _storage.read(key: 'token_timestamp');
      if (tokenTimestamp != null) {
        final timestamp = DateTime.parse(tokenTimestamp);
        if (DateTime.now().difference(timestamp) <= _tokenValidityDuration) {
          return _auth.currentUser;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'token_timestamp');
  }
}
