import 'package:dartz/dartz.dart';
import 'package:mplus_app/data/failure.dart';
import 'package:mplus_app/data/models/order_model.dart';
import 'package:mplus_app/data/services/client_service.dart';

abstract class OrderDataSource {
  Future<Either<Failure, List<OrderModel>>> getOrders();
}

class OrderDataSourceImpl implements OrderDataSource {
  final client = ClientService.init();

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      final response = await client.get('/orders');
      
      List json = response.data;
      List<OrderModel> data = json.map((e) => OrderModel.fromJson(e)).toList();

      return Right(data);
    } catch (ex) {
      throw Left(ex);
    }
  }
}
