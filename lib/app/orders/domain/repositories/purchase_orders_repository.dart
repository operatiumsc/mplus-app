import 'package:mplus_app/app/orders/domain/entities/purchase_order.dart';
import 'package:mplus_app/app/orders/domain/entities/purchase_order_line.dart';

abstract class PurchaseOrdersRepository {
  Future<List<PurchaseOrder>> getPurchaseOrders({int? page});
  Future<List<PurchaseOrderLine>> getPurchaseOrderLines({required int orderId});
}
