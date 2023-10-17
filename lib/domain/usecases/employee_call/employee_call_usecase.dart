import '../../../data/models/employee_call/employee_call_item.dart';

class EmployeeCallUseCase {
  EmployeeCallUseCase();

  List<EmployeeCallItemModel> addItem({
    required List<EmployeeCallItemModel> items,
    required EmployeeCallItemModel newItem,
  }) {
    final index = items.indexWhere((item) => item.id == newItem.id);
    if (index != -1) {
      final item = items[index];
      items[index] = item.copyWith(
        count: item.count + 1,
        updatedAt: DateTime.now(),
      );
    } else {
      items.add(newItem.copyWith(updatedAt: DateTime.now()));
    }

    return items;
  }

  List<EmployeeCallItemModel> removeItem({
    required List<EmployeeCallItemModel> items,
    required String itemId,
  }) {
    final index = items.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      final item = items[index];
      if (item.count > 1) {
        items[index] = item.copyWith(
          count: item.count - 1,
          updatedAt: DateTime.now(),
        );
      }
    }

    return items;
  }

  List<EmployeeCallItemModel> deleteItem({
    required List<EmployeeCallItemModel> items,
    required String itemId,
  }) {
    final index = items.indexWhere((item) => item.id == itemId);
    if (index != 1) {
      items.removeAt(index);
    }

    return items;
  }

  Future<bool> call({required List<EmployeeCallItemModel> items}) {
    return Future(() => true);
  }
}
