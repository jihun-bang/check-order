import 'package:check_order/configs/app_configs.dart';
import 'package:check_order/features/order/data/models/order_item.dart';
import 'package:check_order/features/order/data/models/order_model.dart';
import 'package:check_order/services/auth_service.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import '../../../cart/data/models/cart_item.dart';
import '../repositories/order_repository.dart';

@injectable
class OrderUseCase {
  final OrderRepository _repository;

  OrderUseCase(this._repository);

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

  List<OrderItemModel> _toOrderItems({required List<CartItemModel> cartItems}) {
    final newOrderItems = cartItems.map((e) => OrderItemModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        item: e.item,
        updatedAt: DateTime.now(),
        count: e.count,
        totalAmount: e.item.price * e.count));
    return newOrderItems.toList();
  }

  Future<bool> order({required List<CartItemModel> cartItems}) async {
    final user = getIt<AuthService>().user;
    final table = getIt<AuthService>().tableInfo;
    if (user != null) {
      print(user);

      return _repository.addOrder(
          model: OrderModel(
              tableName: table.tableName,
              storeId: user.email,
              orderType: '메뉴',
              menus: _toOrderItems(cartItems: cartItems),
              orderedAt: DateTime.now(),
              totalAmount: cartItems.map((e) => e.amount).sum));
    } else {
      return false;
    }
  }
}
