import 'package:dartz/dartz.dart';
import 'package:nomadmarket/core/error/failures.dart';
import 'package:nomadmarket/domain/entities/user_entity.dart';
import 'package:nomadmarket/domain/repositories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await _authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
