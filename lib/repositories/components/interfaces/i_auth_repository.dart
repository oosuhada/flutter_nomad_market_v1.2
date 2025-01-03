import '../../../core/entities/user.dart';

abstract class IAuthRepository {
  Future<User?> signUp(String email, String password, String name);
  Future<User?> signIn(String email, String password);
  Future<User?> signInWithEmail(String email, String password);
  Future<User?> signInWithSocialProvider(String provider);
  Future<void> signOut();
  Future<User?> getCurrentUser();
  Future<void> sendPasswordResetEmail(String email);
  Stream<User?> authStateChanges();
}
