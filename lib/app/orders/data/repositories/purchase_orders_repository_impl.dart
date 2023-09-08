import 'package:mplus_app/app/orders/data/data_sources/purchase_orders_data_source.dart';
import 'package:mplus_app/app/orders/data/models/purchase_order_dto.dart';
import 'package:mplus_app/app/orders/data/models/purchase_order_line_dto.dart';
import 'package:mplus_app/app/orders/domain/entities/purchase_order.dart';
import 'package:mplus_app/app/orders/domain/entities/purchase_order_line.dart';
import 'package:mplus_app/app/orders/domain/repositories/purchase_orders_repository.dart';

class PurchaseOrdersRepositoryImpl implements PurchaseOrdersRepository {
  final PurchaseOrdersDataSource _purchaseOrdersDataSource;

  PurchaseOrdersRepositoryImpl(
      {required PurchaseOrdersDataSource purchaseOrdersDataSource})
      : _purchaseOrdersDataSource = purchaseOrdersDataSource;

  @override
  Future<List<PurchaseOrder>> getPurchaseOrders({int? page}) async {
    final orderDTOs =
        await _purchaseOrdersDataSource.getPurchaseOrders(page: page);

    return orderDTOs.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<PurchaseOrderLine>> getPurchaseOrderLines(
      {required int orderId}) async {
    final orderLines =
        await _purchaseOrdersDataSource.getPurchaseOrderLines(orderId: orderId);
    return orderLines.map((e) => e.toEntity()).toList();
  }
}
