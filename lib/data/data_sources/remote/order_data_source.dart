import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mplus_app/data/failure.dart';
import 'package:mplus_app/data/dto/order_dto.dart';
import 'package:mplus_app/injection.dart';

abstract class OrderDataSource {
  Future<Either<Failure, List<OrderDTO>>> getOrders();
}

class OrderDataSourceImpl implements OrderDataSource {
  final _dio = service.get<Dio>();

  @override
  Future<Either<Failure, List<OrderDTO>>> getOrders() async {
    try {
      final response = await _dio.get('/orders');

      List json = response.data;
      List<OrderDTO> data = json.map((e) => OrderDTO.fromJson(e)).toList();

      return Right(data);
    } catch (ex) {
      rethrow;
    }
  }
}
