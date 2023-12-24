import 'package:check_order/data/service/auth_service.dart';
import 'package:check_order/domain/usecases/cart/cart_usecase.dart';
import 'package:check_order/domain/usecases/employee_call/employee_call_usecase.dart';
import 'package:check_order/domain/usecases/home/menu_usecase.dart';
import 'package:check_order/domain/usecases/order/order_usecase.dart';
import 'package:check_order/features/cart/presentation/providers/cart_provider.dart';
import 'package:check_order/features/employee_call/presentation/providers/employee_call_provider.dart';
import 'package:check_order/features/home/presentation/providers/menu_provider.dart';
import 'package:check_order/features/order/presentation/providers/order_provider.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  /// DataSource

  /// Repository

  /// UseCase
  sl.registerLazySingleton<CartUseCase>(() => CartUseCase());
  sl.registerLazySingleton<OrderUseCase>(() => OrderUseCase());
  sl.registerLazySingleton<EmployeeCallUseCase>(() => EmployeeCallUseCase());
  sl.registerLazySingleton<MenuUseCase>(() => MenuUseCase());

  /// Provider
  sl.registerLazySingleton<CartProvider>(() => CartProvider(sl()));
  sl.registerLazySingleton<OrderProvider>(() => OrderProvider(sl()));
  sl.registerLazySingleton<EmployeeCallProvider>(
      () => EmployeeCallProvider(sl()));
  sl.registerLazySingleton<MenuProvider>(() => MenuProvider(sl()));
  sl.registerSingleton<AuthService>(AuthService());
}
