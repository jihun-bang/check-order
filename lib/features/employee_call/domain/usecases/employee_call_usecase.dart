import 'package:check_order/features/order/data/models/order_item.dart';

class EmployeeCallUseCase {
  EmployeeCallUseCase();

  List<OrderItemModel> addItem({
    required List<OrderItemModel> items,
    required OrderItemModel newItem,
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

  List<OrderItemModel> removeItem({
    required List<OrderItemModel> items,
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

  List<OrderItemModel> deleteItem({
    required List<OrderItemModel> items,
    required String itemId,
  }) {
    final index = items.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      items.removeAt(index);
    }

    return items;
  }

  Future<bool> call({required List<OrderItemModel> items}) {
    return Future(() => true);
  }
}
