// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boilerplate/data/constant/register_module.dart' as _i1018;
import 'package:boilerplate/data/remote/product_remote.dart' as _i255;
import 'package:boilerplate/data/repository/product_repository/product_repository_impl.dart'
    as _i501;
import 'package:boilerplate/domain/repository/product_repository/product_repository.dart'
    as _i580;
import 'package:boilerplate/domain/usecases/product_usecases/product_usecases.dart'
    as _i470;
import 'package:boilerplate/presentation/auth/sign_in/bloc/sign_in_bloc.dart'
    as _i827;
import 'package:boilerplate/presentation/auth/sign_up/bloc/sign_up_bloc.dart'
    as _i447;
import 'package:boilerplate/presentation/home.dart/bloc/home_bloc.dart'
    as _i604;
import 'package:boilerplate/presentation/splash_screen/bloc/splashscreen_bloc.dart'
    as _i288;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i827.SignInBloc>(() => _i827.SignInBloc());
    gh.factory<_i447.SignUpBloc>(() => _i447.SignUpBloc());
    gh.factory<_i288.SplashscreenBloc>(() => _i288.SplashscreenBloc());
    await gh.lazySingletonAsync<_i361.Dio>(
      () => registerModule.dio(),
      preResolve: true,
    );
    gh.lazySingleton<_i255.ProductRemote>(
        () => registerModule.productRemote(gh<_i361.Dio>()));
    gh.lazySingleton<_i580.ProductRepository>(
        () => _i501.ProductRepositoryImpl(gh<_i255.ProductRemote>()));
    gh.factory<_i470.ProductUsecases>(
        () => _i470.ProductUsecases(gh<_i580.ProductRepository>()));
    gh.factory<_i604.HomeBloc>(
        () => _i604.HomeBloc(gh<_i470.ProductUsecases>()));
    return this;
  }
}

class _$RegisterModule extends _i1018.RegisterModule {}
