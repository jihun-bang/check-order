import '../../data/models/order_model.dart';

abstract class OrderRepository {
  Future<bool> addOrder({required OrderModel model});
}
