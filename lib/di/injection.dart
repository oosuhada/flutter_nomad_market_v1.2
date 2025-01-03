import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nomadmarket/data/datasources/local/auth_local_datasource.dart';
import 'package:nomadmarket/data/repositories/auth_repository_impl.dart';
import 'package:nomadmarket/domain/repositories/i_auth_repository.dart';
import 'package:nomadmarket/domain/usecases/auth/login_usecase.dart';
import 'package:nomadmarket/domain/usecases/auth/register_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // SharedPreferences 초기화
  final sharedPreferences = await SharedPreferences.getInstance();

  // Firebase Services
  final firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = firestore.FirebaseFirestore.instance;
  final storage = firebase_storage.FirebaseStorage.instance;
  final messaging = FirebaseMessaging.instance;

  // Core Services
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Firebase Dependencies
  getIt.registerSingleton<FirebaseAuth>(firebaseAuth);
  getIt.registerSingleton<firestore.FirebaseFirestore>(firestoreInstance);
  getIt.registerSingleton<firebase_storage.FirebaseStorage>(storage);
  getIt.registerSingleton<FirebaseMessaging>(messaging);

  // DataSources
  getIt.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSource(getIt<SharedPreferences>()),
  );
  getIt.registerSingleton<UserRemoteDataSource>(
    UserRemoteDataSource(getIt<firestore.FirebaseFirestore>()),
  );
  getIt.registerSingleton<StorageRemoteDataSource>(
    StorageRemoteDataSource(getIt<firebase_storage.FirebaseStorage>()),
  );

  // Repositories
  getIt.registerSingleton<IAuthRepository>(
    AuthRepositoryImpl(
      getIt<FirebaseAuth>(),
      getIt<AuthLocalDataSource>(),
      getIt<UserRemoteDataSource>(),
    ),
  );
  getIt.registerSingleton<IUserRepository>(
    UserRepositoryImpl(
      getIt<UserRemoteDataSource>(),
      getIt<StorageRemoteDataSource>(),
    ),
  );

  // UseCases (기존 유지)
  getIt.registerFactory(() => LoginUseCase(getIt<IAuthRepository>()));
  getIt.registerFactory(() => RegisterUseCase(getIt<IAuthRepository>()));

  // 추가 UseCase들
  getIt.registerFactory(() => UpdateProfileUseCase(getIt<IUserRepository>()));
  getIt.registerFactory(
      () => UploadProfileImageUseCase(getIt<IUserRepository>()));
}
