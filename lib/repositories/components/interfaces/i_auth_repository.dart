import '../../../models/components/entities/user.dart';

abstract class IAuthRepository {
  Future<User?> signIn(String email, String password);
  Future<User?> signUp(String email, String password, String name);
  Future<void> signOut();
  Future<User?> getCurrentUser();
  Future<void> sendPasswordResetEmail(String email);
  Stream<User?> authStateChanges();
}
