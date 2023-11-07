import 'package:check_order/core/utils/logger.dart';

import '../../../data/models/cart/cart_item.dart';
import '../../../data/models/menu/menu_item.dart';

class CartUseCase {
  CartUseCase();

  List<CartItemModel> addCartItem({
    required List<CartItemModel> cartItems,
    required MenuItemModel newItem,
  }) {
    final index =
        cartItems.indexWhere((cartItem) => cartItem.item.id == newItem.id);
    if (index != -1) {
      final cartItem = cartItems[index];
      cartItems[index] = cartItem.copyWith(
        count: cartItem.count + 1,
        updatedAt: DateTime.now(),
      );
    } else {
      cartItems.add(CartItemModel(
        id: newItem.id,
        item: newItem,
        updatedAt: DateTime.now(),
      ));
    }

    return cartItems;
  }

  List<CartItemModel> removeCartItem({
    required List<CartItemModel> cartItems,
    required String cartItemId,
  }) {
    final index = cartItems.indexWhere((cartItem) => cartItem.id == cartItemId);
    if (index != -1) {
      final cartItem = cartItems[index];
      if (cartItem.count > 1) {
        cartItems[index] = cartItem.copyWith(
          count: cartItem.count - 1,
          updatedAt: DateTime.now(),
        );
      }
    }

    return cartItems;
  }

  List<CartItemModel> deleteCartItem({
    required List<CartItemModel> cartItems,
    required String cartItemId,
  }) {
    Logger.d('cartItems=${cartItems.map((e) => e.id)}');
    Logger.d('cartItemId=$cartItemId');
    final index = cartItems.indexWhere((cartItem) => cartItem.id == cartItemId);
    if (index != -1) {
      cartItems.removeAt(index);
    }

    return cartItems;
  }
}
