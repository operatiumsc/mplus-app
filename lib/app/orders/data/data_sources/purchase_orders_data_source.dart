import 'package:mplus_app/app/orders/data/dto/purchase_order_dto.dart';
import 'package:mplus_app/app/orders/data/dto/purchase_order_line_dto.dart';
import 'package:mplus_app/utils/services/rest.dart';

abstract class PurchaseOrdersDataSource {
  Future<List<PurchaseOrderDTO>> getPurchaseOrders({int? page});
  Future<List<PurchaseOrderLineDTO>> getPurchaseOrderLines(
      {required int orderId});
}

class PurchaseOrdersDataSourceImpl implements PurchaseOrdersDataSource {
  final _client = Rest().client;

  @override
  Future<List<PurchaseOrderDTO>> getPurchaseOrders({int? page}) async {
    try {
      final response =
          await _client.get('/orders', queryParameters: {'page': page});

      List json = response.data;
      List<PurchaseOrderDTO> orders =
          json.map((e) => PurchaseOrderDTO.fromJson(e)).toList();

      return orders;
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<List<PurchaseOrderLineDTO>> getPurchaseOrderLines(
      {required int orderId}) async {
    try {
      final response = await _client.get('/order/$orderId/lines');

      List json = response.data;
      List<PurchaseOrderLineDTO> orderLines =
          json.map((e) => PurchaseOrderLineDTO.fromJson(e)).toList();

      return orderLines;
    } catch (ex) {
      rethrow;
    }
  }
}
