// lib/features/auth/providers/auth_repository_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl();
}
