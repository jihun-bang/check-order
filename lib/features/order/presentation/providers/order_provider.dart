import 'package:check_order/base_provider.dart';
import 'package:check_order/features/cart/data/models/cart_item.dart';
import 'package:check_order/features/cart/presentation/providers/cart_provider.dart';
import 'package:check_order/features/order/data/models/order_item.dart';
import 'package:check_order/features/order/domain/usecases/order_usecase.dart';

import '../../../../dependencies_injection.dart';

class OrderProvider extends BaseProvider {
  final OrderUseCase _useCase;

  List<OrderItemModel> _items = [];
  List<OrderItemModel> get items => _items;

  OrderProvider(this._useCase);

  Future<bool> addOrder(
      {required List<CartItemModel> cartItems,
      bool isEmployeeCall = false}) async {
    final success = await _useCase.order(cartItems: cartItems);

    if (success) {
      _items = _useCase.addItems(orderItems: items, cartItems: cartItems);
      if (!isEmployeeCall) {
        sl<CartProvider>().clear();
      }
      notifyListeners();
    }
    return success;
  }

  @override
  void clear() {
    _items.clear();
  }
}
