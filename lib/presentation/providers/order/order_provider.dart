import 'package:check_order/data/models/cart/cart_item.dart';
import 'package:check_order/data/models/order/order_item.dart';
import 'package:check_order/domain/usecases/order/order_usecase.dart';
import 'package:check_order/presentation/providers/cart/cart_provider.dart';
import 'package:flutter/widgets.dart';

import '../../../dependencies_injection.dart';

class OrderProvider extends ChangeNotifier {
  final OrderUseCase _useCase;

  List<OrderItemModel> _items = [];
  List<OrderItemModel> get items => _items;

  OrderProvider(this._useCase);

  Future<bool> addOrder({required List<CartItemModel> cartItems}) async {
    final success = await _useCase.order(cartItems: cartItems);
    if (success) {
      _items = _useCase.addItems(orderItems: items, cartItems: cartItems);
      sl<CartProvider>().clear();
      notifyListeners();
    }
    return success;
  }
}
