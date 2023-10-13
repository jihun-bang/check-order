import 'package:check_order/data/models/order/order_item.dart';

import '../../../data/models/cart/cart_item.dart';

class OrderUseCase {
  OrderUseCase();

  List<OrderItemModel> addItems(
      {required List<OrderItemModel> orderItems,
      required List<CartItemModel> cartItems}) {
    final newOrderItems = cartItems.map((e) => OrderItemModel(
        id: e.id,
        item: e.item,
        updatedAt: DateTime.now(),
        totalAmount: e.item.price * e.count));
    orderItems.addAll(newOrderItems);
    return orderItems;
  }

  Future<bool> order({required List<CartItemModel> cartItems}) {
    return Future(() => true);
  }
}
