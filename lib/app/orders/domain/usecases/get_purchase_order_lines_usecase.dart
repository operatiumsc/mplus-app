import 'package:mplus_app/app/orders/domain/entities/purchase_order_line.dart';
import 'package:mplus_app/app/orders/domain/repositories/purchase_orders_repository.dart';

class GetPurchaseOrderLinesUseCase {
  final PurchaseOrdersRepository _purchaseOrdersRepository;

  GetPurchaseOrderLinesUseCase(
      {required PurchaseOrdersRepository purchaseOrdersRepository})
      : _purchaseOrdersRepository = purchaseOrdersRepository;

  Future<List<PurchaseOrderLine>> call({required int orderId}) {
    return _purchaseOrdersRepository.getPurchaseOrderLines(orderId: orderId);
  }
}
