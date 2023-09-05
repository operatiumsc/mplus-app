import 'package:mplus_app/domain/entities/purchase_order.dart';
import 'package:mplus_app/domain/repositories/purchase_orders_repository.dart';

class GetPurchaseOrdersUseCase {
  final PurchaseOrdersRepository _purchaseOrdersRepository;

  GetPurchaseOrdersUseCase(
      {required PurchaseOrdersRepository purchaseOrdersRepository})
      : _purchaseOrdersRepository = purchaseOrdersRepository;

  Future<List<PurchaseOrder>> call({int? page}) {
    return _purchaseOrdersRepository.getPurchaseOrders(page: page);
  }
}
