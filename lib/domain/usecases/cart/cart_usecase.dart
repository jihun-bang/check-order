import 'package:check_order/core/utils/logger.dart';

import '../../../data/models/cart/cart_item.dart';
import '../../../data/models/menu/menu_item.dart';

class CartUseCase {
  CartUseCase();

  List<CartItemModel> addCartItem({
    required List<CartItemModel> cartItems,
    required MenuItemModel newItem,
  }) {
    final index = cartItems.indexWhere((item) => item.id == newItem.id);
    if (index != -1) {
      final cartItem = cartItems[index];
      cartItems[index] = cartItem.copyWith(count: cartItem.count + 1);
    } else {
      cartItems.add(CartItemModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        item: newItem,
        updatedAt: DateTime.now(),
      ));
    }

    return cartItems;
  }

  List<CartItemModel> removeCartItem({
    required List<CartItemModel> cartItems,
    required MenuItemModel item,
  }) {
    final index = cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (index != 1) {
      final cartItem = cartItems[index];
      if (cartItem.count > 1) {
        cartItems[index] = cartItem.copyWith(count: cartItem.count - 1);
      } else {
        cartItems.removeAt(index);
      }
    }

    return cartItems;
  }
}
