import 'package:check_order/features/order/data/models/order_item.dart';

import '../../../cart/data/models/cart_item.dart';

class OrderUseCase {
  OrderUseCase();

  List<OrderItemModel> addItems(
      {required List<OrderItemModel> orderItems,
      required List<CartItemModel> cartItems}) {
    final newOrderItems = cartItems.map((e) => OrderItemModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        item: e.item,
        updatedAt: DateTime.now(),
        count: e.count,
        totalAmount: e.item.price * e.count));
    orderItems.addAll(newOrderItems);
    return orderItems;
  }

  Future<bool> order({required List<CartItemModel> cartItems}) {
    return Future(() => true);
  }
}
