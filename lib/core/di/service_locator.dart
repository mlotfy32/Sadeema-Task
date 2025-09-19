import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:sadeema_task/features/auth/login/data/auth_repository_impl.dart';
import 'package:sadeema_task/features/auth/login/domain/auth_repository.dart';
import 'package:sadeema_task/features/auth/login/domain/login_usecase.dart';
import 'package:sadeema_task/features/auth/login/presentation/cubit/login/login_cubit.dart';
import 'package:sadeema_task/features/auth/signUp/data/auth_register_repository_impl.dart';
import 'package:sadeema_task/features/auth/signUp/domain/auth_register_repository.dart';
import 'package:sadeema_task/features/auth/signUp/domain/register_usecase.dart';
import 'package:sadeema_task/features/auth/signUp/presentation/cubit/register/register_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Dio instance
  sl.registerLazySingleton<Dio>(() => Dio());

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // UseCase
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl<AuthRepository>()),
  );

  // Cubit
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl<LoginUseCase>()));
  sl.registerLazySingleton<AuthRegisterRepository>(
    () => AuthRegisterRepositoryImpl(),
  );

  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(sl<AuthRegisterRepository>()),
  );

  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl<RegisterUseCase>()));
}
