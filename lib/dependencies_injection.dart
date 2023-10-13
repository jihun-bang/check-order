import 'package:check_order/domain/usecases/cart/cart_usecase.dart';
import 'package:check_order/domain/usecases/order/order_usecase.dart';
import 'package:check_order/presentation/providers/cart/cart_provider.dart';
import 'package:check_order/presentation/providers/order/order_provider.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  /// DataSource

  /// Repository

  /// UseCase
  sl.registerLazySingleton<CartUseCase>(() => CartUseCase());
  sl.registerLazySingleton<OrderUseCase>(() => OrderUseCase());

  /// Provider
  sl.registerLazySingleton<CartProvider>(() => CartProvider(sl()));
  sl.registerLazySingleton<OrderProvider>(() => OrderProvider(sl()));
}
