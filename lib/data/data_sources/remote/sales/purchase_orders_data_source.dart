import 'package:dio/dio.dart';
import 'package:mplus_app/data/dto/purchase_order_dto.dart';
import 'package:mplus_app/injection.dart';

abstract class PurchaseOrdersDataSource {
  Future<List<PurchaseOrderDTO>> getPurchaseOrders({int? page});
}

class PurchaseOrdersDataSourceImpl implements PurchaseOrdersDataSource {
  final _dio = service.get<Dio>();

  @override
  Future<List<PurchaseOrderDTO>> getPurchaseOrders({int? page}) async {
    try {
      final response =
          await _dio.get('/orders', queryParameters: {'page': page});

      List json = response.data;
      List<PurchaseOrderDTO> orders =
          json.map((e) => PurchaseOrderDTO.fromJson(e)).toList();

      return orders;
    } catch (ex) {
      rethrow;
    }
  }
}
