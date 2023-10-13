import 'package:check_order/domain/usecases/order/order_usecase.dart';
import 'package:flutter/widgets.dart';

class OrderProvider extends ChangeNotifier {
  final OrderUseCase _useCase;

  OrderProvider(this._useCase);

  Future<bool> addOrder() async {
    final success = await _useCase.addOrder();
    return success;
  }
}
