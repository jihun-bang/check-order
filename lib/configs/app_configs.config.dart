// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:check_order/core/data/local/datasource/auth_storage.dart'
    as _i9;
import 'package:check_order/core/data/local/storage/storage.dart' as _i4;
import 'package:check_order/core/data/remote/datasource/auth_remote_data_source.dart'
    as _i5;
import 'package:check_order/core/data/remote/repositories/auth_repository_impl.dart'
    as _i7;
import 'package:check_order/core/domain/repositories/auth_repository.dart'
    as _i6;
import 'package:check_order/core/domain/usecases/auth_usecase.dart' as _i10;
import 'package:check_order/core/theme/colors.dart' as _i3;
import 'package:check_order/features/order/data/datasource/order_remote_data_source.dart'
    as _i11;
import 'package:check_order/features/order/data/repositories/order_repository_impl.dart'
    as _i13;
import 'package:check_order/features/order/domain/repositories/order_repository.dart'
    as _i12;
import 'package:check_order/features/order/domain/usecases/order_usecase.dart'
    as _i14;
import 'package:check_order/services/auth_service.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppColors>(_i3.AppColors());
    await gh.singletonAsync<_i4.AppStorage>(
      () {
        final i = _i4.AppStorage();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i5.AuthDataSource>(() => _i5.AuthDataSourceImpl());
    gh.factory<_i6.AuthRepository>(
        () => _i7.AuthRepositoryImpl(gh<_i5.AuthDataSource>()));
    await gh.singletonAsync<_i8.AuthService>(
      () {
        final i = _i8.AuthService();
        return i.getTable().then((_) => i);
      },
      preResolve: true,
    );
    gh.singleton<_i9.AuthStorage>(_i9.AuthStorage(gh<_i4.AppStorage>()));
    gh.factory<_i10.AuthUseCase>(() => _i10.AuthUseCase(
          gh<_i6.AuthRepository>(),
          gh<_i9.AuthStorage>(),
        ));
    gh.factory<_i11.OrderDataSource>(() => _i11.OrderDataSourceImpl());
    gh.factory<_i12.OrderRepository>(
        () => _i13.OrderRepositoryImpl(gh<_i11.OrderDataSource>()));
    gh.factory<_i14.OrderUseCase>(
        () => _i14.OrderUseCase(gh<_i12.OrderRepository>()));
    return this;
  }
}
