// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ligalife/core/di/register_module.dart' as _i458;
import 'package:ligalife/core/network/network_info.dart' as _i799;
import 'package:ligalife/core/network/services/api_service.dart' as _i316;
import 'package:ligalife/features/auth/data/remote/auth_api_service.dart'
    as _i157;
import 'package:ligalife/features/auth/data/repository/auth_repository_impl.dart'
    as _i418;
import 'package:ligalife/features/auth/domain/repositories/auth_repository.dart'
    as _i334;
import 'package:ligalife/features/auth/domain/usecases/login_usecase.dart'
    as _i433;
import 'package:ligalife/features/auth/presentation/cubit/login_cubit.dart'
    as _i582;
import 'package:ligalife/features/upload/data/repositories/upload_repository_impl.dart'
    as _i308;
import 'package:ligalife/features/upload/domain/repositories/upload_repository.dart'
    as _i505;
import 'package:ligalife/features/upload/domain/usecases/upload_images_usecase.dart'
    as _i431;
import 'package:ligalife/features/upload/presentation/cubit/upload_cubit.dart'
    as _i222;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i799.NetworkInfo>(
      () => _i799.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i316.ApiService>(
      () => registerModule.apiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i505.UploadRepository>(
      () => _i308.UploadRepositoryImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i157.AuthApiService>(
      () => _i157.AuthApiService(gh<_i316.ApiService>()),
    );
    gh.factory<_i431.UploadImagesUseCase>(
      () => _i431.UploadImagesUseCase(gh<_i505.UploadRepository>()),
    );
    gh.lazySingleton<_i334.AuthRepository>(
      () => _i418.AuthRepositoryImpl(gh<_i157.AuthApiService>()),
    );
    gh.factory<_i222.UploadCubit>(
      () => _i222.UploadCubit(gh<_i431.UploadImagesUseCase>()),
    );
    gh.factory<_i433.LoginUseCase>(
      () => _i433.LoginUseCase(gh<_i334.AuthRepository>()),
    );
    gh.factory<_i582.LoginCubit>(
      () => _i582.LoginCubit(gh<_i433.LoginUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i458.RegisterModule {}
