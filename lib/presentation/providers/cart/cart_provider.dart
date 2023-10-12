import 'package:check_order/data/models/cart/cart_item.dart';
import 'package:check_order/data/models/menu/menu_item.dart';
import 'package:check_order/domain/usecases/cart/cart_usecase.dart';
import 'package:flutter/widgets.dart';

class CartProvider extends ChangeNotifier {
  final CartUseCase _useCase;

  List<CartItemModel> _items = [];
  List<CartItemModel> get items => _items;

  CartProvider(this._useCase);

  void addCartItem(MenuItemModel newItem) {
    _items = _useCase.addCartItem(cartItems: _items, newItem: newItem);
    notifyListeners();
  }

  void removeCartItem(MenuItemModel item) {
    _items = _useCase.removeCartItem(cartItems: _items, item: item);
    notifyListeners();
  }
}
