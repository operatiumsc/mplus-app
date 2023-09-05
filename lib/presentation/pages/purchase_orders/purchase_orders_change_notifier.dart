import 'package:flutter/material.dart';
import 'package:mplus_app/domain/entities/purchase_order.dart';
import 'package:mplus_app/domain/usecases/sales/get_purchase_orders_usecase.dart';

enum PurchaseOrderViewStatus { initial, loading, success, failed }

enum PurchaseOrderItemStatus { initial, loading, success, failed }

class PurchaseOrdersChangeNotifier extends ChangeNotifier {
  final GetPurchaseOrdersUseCase _getPurchaseOrderUseCase;

  PurchaseOrdersChangeNotifier(
      {required GetPurchaseOrdersUseCase getPurchaseOrdersUseCase})
      : _getPurchaseOrderUseCase = getPurchaseOrdersUseCase;

  var purchaseOrderViewStatus = PurchaseOrderViewStatus.initial;

  Future<List<PurchaseOrder>>? futurePurchaseOrders;
  List<PurchaseOrder> purchaseOrders = [];
  int pageIndex = 0;

  Future<void> onInit() async {
    try {
      purchaseOrderViewStatus = PurchaseOrderViewStatus.loading;
      notifyListeners();

      futurePurchaseOrders = _getPurchaseOrderUseCase.call(page: pageIndex);

      purchaseOrders = await futurePurchaseOrders ?? [];
      purchaseOrderViewStatus = PurchaseOrderViewStatus.success;
      notifyListeners();
    } catch (ex, stackTrace) {
      purchaseOrderViewStatus = PurchaseOrderViewStatus.failed;
      notifyListeners();

      debugPrint(ex.toString());
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  Future<void> onScrollEnd() async {
    pageIndex += 1;
  }
}
