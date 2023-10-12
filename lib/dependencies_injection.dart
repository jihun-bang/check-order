import 'package:check_order/domain/usecases/cart/cart_usecase.dart';
import 'package:check_order/presentation/providers/cart/cart_provider.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  /// DataSource

  /// Repository

  /// UseCase
  sl.registerLazySingleton<CartUseCase>(() => CartUseCase());

  /// Provider
  sl.registerFactory<CartProvider>(() => CartProvider(sl()));
}
