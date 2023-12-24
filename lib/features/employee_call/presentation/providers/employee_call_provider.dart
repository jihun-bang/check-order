import 'package:check_order/data/models/cart/cart_item.dart';
import 'package:check_order/data/models/menu/menu_item.dart';
import 'package:check_order/domain/usecases/employee_call/employee_call_usecase.dart';
import 'package:check_order/features/order/presentation/providers/order_provider.dart';
import 'package:collection/collection.dart';

import '../../../../base_provider.dart';
import '../../../../data/models/order/order_item.dart';
import '../../../../dependencies_injection.dart';

class EmployeeCallProvider extends BaseProvider {
  final EmployeeCallUseCase _useCase;

  List<OrderItemModel> _items = [];
  List<OrderItemModel> get items => _items;

  List<OrderItemModel> _selectedItems = [];
  List<OrderItemModel> get selectedItems => _selectedItems;

  EmployeeCallProvider(this._useCase) {
    _items = [
      '직원호출',
      '냅킨',
      '국그릇',
      '숟가락',
      '젓가락',
      '핸드폰 충전',
      '숟가락',
      '담요',
      '앞접시',
      '테이블 정리',
      '물컵'
    ]
        .mapIndexed(
          (index, e) => OrderItemModel(
            id: index.toString(),
            item: MenuItemModel(
                id: index.toString(), name: e, category: '직원호출', price: 0),
            updatedAt: DateTime.now(),
            totalAmount: 0,
          ),
        )
        .toList();
  }

  bool isSelectedItem(String id) {
    return selectedItems.map((e) => e.id).contains(id);
  }

  void addItem(OrderItemModel newItem) {
    _selectedItems = _useCase.addItem(items: selectedItems, newItem: newItem);
    notifyListeners();
  }

  void removeItem(String itemId) {
    _selectedItems = _useCase.removeItem(items: selectedItems, itemId: itemId);
    notifyListeners();
  }

  void deleteItem(String itemId) {
    _selectedItems = _useCase.deleteItem(items: selectedItems, itemId: itemId);
    notifyListeners();
  }

  Future<bool> call() async {
    final result = await _useCase.call(items: selectedItems);
    sl<OrderProvider>().addOrder(
        cartItems: selectedItems
            .map((e) => CartItemModel(
                id: e.id, item: e.item, updatedAt: e.updatedAt, count: e.count))
            .toList());
    if (result) {
      _selectedItems.clear();
      notifyListeners();
    }
    return result;
  }

  @override
  void clear() {
    _selectedItems.clear();
    notifyListeners();
  }
}
