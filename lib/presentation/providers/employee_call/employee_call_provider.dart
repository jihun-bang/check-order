import 'package:check_order/data/models/employee_call/employee_call_item.dart';
import 'package:check_order/domain/usecases/employee_call/employee_call_usecase.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class EmployeeCallProvider extends ChangeNotifier {
  final EmployeeCallUseCase _useCase;

  List<EmployeeCallItemModel> _items = [];
  List<EmployeeCallItemModel> get items => _items;

  List<EmployeeCallItemModel> _selectedItems = [];
  List<EmployeeCallItemModel> get selectedItems => _selectedItems;

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
          (index, e) => EmployeeCallItemModel(
            id: index.toString(),
            name: e,
            updatedAt: DateTime.now(),
          ),
        )
        .toList();
  }

  bool isSelectedItem(String id) {
    return selectedItems.map((e) => e.id).contains(id);
  }

  void addItem(EmployeeCallItemModel newItem) {
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
}
