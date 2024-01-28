import 'package:injectable/injectable.dart';

import '../../domain/repositories/order_repository.dart';
import '../datasource/order_remote_data_source.dart';
import '../models/order_model.dart';

@Injectable(as: OrderRepository)
class OrderRepositoryImpl extends OrderRepository {
  final OrderDataSource _dataSource;

  OrderRepositoryImpl(this._dataSource);

  @override
  Future<bool> addOrder({required OrderModel model}) {
    return _dataSource
        .addOrder(model: model)
        .then((value) => value.fold((l) => false, (r) => true));
  }
}
