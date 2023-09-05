import 'package:mplus_app/data/data_sources/remote/sales/purchase_orders_data_source.dart';
import 'package:mplus_app/data/dto/purchase_order_dto.dart';
import 'package:mplus_app/domain/entities/purchase_order.dart';
import 'package:mplus_app/domain/repositories/purchase_orders_repository.dart';

class PurchaseOrdersRepositoryImpl implements PurchaseOrdersRepository {
  final PurchaseOrdersDataSource _purchaseOrdersDataSource;

  PurchaseOrdersRepositoryImpl(
      {required PurchaseOrdersDataSource purchaseOrdersDataSource})
      : _purchaseOrdersDataSource = purchaseOrdersDataSource;

  @override
  Future<List<PurchaseOrder>> getPurchaseOrders({int? page}) async {
    try {
      final orderDTOs =
          await _purchaseOrdersDataSource.getPurchaseOrders(page: page);

      return orderDTOs.map((e) => e.toEntity()).toList();
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future getPurchaseOrderDetails(String orderId) {
    // TODO: implement getPurchaseOrderDetails
    throw UnimplementedError();
  }
}
