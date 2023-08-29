import 'package:dartz/dartz.dart';
import 'package:mplus_app/data/failure.dart';
import 'package:mplus_app/data/models/order_model.dart';
import 'package:mplus_app/data/data_sources/remote/rest_service.dart';

import '../../../domain/data_sources/order_data_source.dart';
import '../../exception.dart';

class OrderDataSourceImpl implements OrderDataSource {
  final client = DioClient().init();

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      final response = await client.get('/orders');

      List json = response.data;
      List<OrderModel> data = json.map((e) => OrderModel.fromJson(e)).toList();

      return Right(data);
    } catch (ex) {
      throw Left(handleException(ex));
    }
  }
}