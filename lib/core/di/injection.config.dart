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
import 'package:ligalife/features/auth/data/repository/auth_repository.dart'
    as _i1015;

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
    gh.lazySingleton<_i1015.AuthRepository>(
      () => _i1015.AuthRepository(gh<_i316.ApiService>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i458.RegisterModule {}
