import '../../../models/components/entities/user.dart';
import '../../../models/components/entities/user_setting.dart';
import '../../../models/components/entities/user_verification.dart';

abstract class IUserRepository {
  Future<User> createUser(User user);
  Future<User?> getUserById(String id);
  Future<User?> getUserByEmail(String email);
  Future<User> updateUser(User user);
  Future<void> deleteUser(String id);
  Future<UserVerification> verifyUser(UserVerification verification);
  Future<UserSetting> updateUserSettings(UserSetting settings);
}
