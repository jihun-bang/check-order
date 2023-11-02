import 'package:check_order/domain/usecases/cart/cart_usecase.dart';
import 'package:check_order/domain/usecases/employee_call/employee_call_usecase.dart';
import 'package:check_order/domain/usecases/home/menu_usecase.dart';
import 'package:check_order/domain/usecases/order/order_usecase.dart';
import 'package:check_order/presentation/providers/cart/cart_provider.dart';
import 'package:check_order/presentation/providers/employee_call/employee_call_provider.dart';
import 'package:check_order/presentation/providers/home/menu_provider.dart';
import 'package:check_order/presentation/providers/order/order_provider.dart';
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
}
