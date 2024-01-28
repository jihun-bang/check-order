import 'package:check_order/core/utils/logger.dart';
import 'package:check_order/features/order/data/models/order_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/exception/exception.dart';

abstract class OrderDataSource {
  Future<Either<ServerFailure, bool>> addOrder({required OrderModel model});
}

@Injectable(as: OrderDataSource)
class OrderDataSourceImpl implements OrderDataSource {
  OrderDataSourceImpl();

  @override
  Future<Either<ServerFailure, bool>> addOrder(
      {required OrderModel model}) async {
    try {
      return await ordersRef.add(model).then((value) {
        return const Right(true);
      });
    } catch (e) {
      Logger.e(e);
      return Left(ServerFailure(code: 'FirebaseError', message: e.toString()));
    }
  }
}
