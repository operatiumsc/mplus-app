import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../../data/models/order_model.dart';

abstract class OrderDataSource {
  Future<Either<Failure, List<OrderModel>>> getOrders();
}
