import 'package:mplus_app/domain/entities/purchase_order.dart';

abstract class PurchaseOrdersRepository {
  Future<List<PurchaseOrder>> getPurchaseOrders({int? page});
  Future getPurchaseOrderDetails(String orderId);
}
