import 'package:check_order/base_provider.dart';
import 'package:check_order/features/cart/data/models/cart_item.dart';
import 'package:check_order/features/cart/domain/usecases/cart_usecase.dart';
import 'package:check_order/features/home/data/models/menu_item.dart';

class CartProvider extends BaseProvider {
  final CartUseCase _useCase;

  List<CartItemModel> _items = [];
  List<CartItemModel> get items => _items;

  CartProvider(this._useCase);

  void addCartItem(MenuItemModel newItem) {
    _items = _useCase.addCartItem(cartItems: items, newItem: newItem);
    notifyListeners();
  }

  void removeCartItem(String cartItemId) {
    _items = _useCase.removeCartItem(cartItems: items, cartItemId: cartItemId);
    notifyListeners();
  }

  void deleteCartItem(String cartItemId) {
    _items = _useCase.deleteCartItem(cartItems: items, cartItemId: cartItemId);
    notifyListeners();
  }

  @override
  void clear() {
    _items.clear();
    notifyListeners();
  }
}
