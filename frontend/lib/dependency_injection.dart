import 'package:frontend/features/home/data/services/api_service.dart';
import 'package:frontend/features/home/logic/cubit/list_cubit.dart';
import 'package:frontend/features/login/data/repos/login_repo.dart';
import 'package:frontend/features/login/data/services/login_api_service.dart';
import 'package:frontend/features/register/data/repos/register_repo.dart';
import 'package:frontend/features/register/data/services/register_api_service.dart';
import 'package:frontend/features/register/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8000',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<LoginApiService>(
      () => LoginApiService(getIt<Dio>()));

  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(getIt<LoginApiService>()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  getIt.registerLazySingleton<RegisterApiService>(
      () => RegisterApiService(getIt<Dio>()));

  getIt.registerLazySingleton<RegisterRepo>(
      () => RegisterRepo(getIt<RegisterApiService>()));

  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt<RegisterRepo>()));

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerFactory<ListCubit>(() => ListCubit(getIt<ApiService>()));
}

class ForgetPasswordCubit {}
