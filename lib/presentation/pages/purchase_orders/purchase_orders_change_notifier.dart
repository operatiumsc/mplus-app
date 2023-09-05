import 'package:flutter/material.dart';
import 'package:mplus_app/domain/entities/purchase_order.dart';
import 'package:mplus_app/domain/entities/purchase_order_line.dart';
import 'package:mplus_app/domain/usecases/sales/get_purchase_order_lines_usecase.dart';
import 'package:mplus_app/domain/usecases/sales/get_purchase_orders_usecase.dart';

enum PurchaseOrderViewStatus { initial, loading, success, failed }

enum PurchaseOrderItemStatus { initial, loading, success, failed }

class PurchaseOrdersChangeNotifier extends ChangeNotifier {
  final GetPurchaseOrdersUseCase _getPurchaseOrderUseCase;
  final GetPurchaseOrderLinesUseCase _getPurchaseOrderLinesUseCase;

  PurchaseOrdersChangeNotifier({
    required GetPurchaseOrdersUseCase getPurchaseOrdersUseCase,
    required GetPurchaseOrderLinesUseCase getPurchaseOrderLinesUseCase,
  })  : _getPurchaseOrderUseCase = getPurchaseOrdersUseCase,
        _getPurchaseOrderLinesUseCase = getPurchaseOrderLinesUseCase;

  var purchaseOrderViewStatus = PurchaseOrderViewStatus.initial;

  Future<List<PurchaseOrder>>? futurePurchaseOrders;
  List<PurchaseOrder> purchaseOrders = [];
  int pageIndex = 0;

  Future<void> onInit() async {
    try {
      purchaseOrderViewStatus = PurchaseOrderViewStatus.loading;
      notifyListeners();

      pageIndex = 0;

      if (purchaseOrders.isEmpty) {
        futurePurchaseOrders = _getPurchaseOrderUseCase.call(page: pageIndex);
      }

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

  Future<void> onRefreshedPage() async {
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
    try {
      pageIndex += 1;
      debugPrint(pageIndex.toString());

      futurePurchaseOrders = _getPurchaseOrderUseCase.call(page: pageIndex);

      final additionalOrders = await futurePurchaseOrders ?? [];

      if (additionalOrders.isNotEmpty) {
        purchaseOrders.addAll(additionalOrders);
        notifyListeners();
      }
    } catch (ex, stackTrace) {
      debugPrint(ex.toString());
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  Future<List<PurchaseOrderLine>>? futurePurchaseOrderLines;
  List<PurchaseOrderLine> purchaseOrderLines = [];

  Future<void> onExpandedOrder({required int orderId}) async {
    try {
      futurePurchaseOrderLines =
          _getPurchaseOrderLinesUseCase.call(orderId: orderId);

      purchaseOrderLines = await futurePurchaseOrderLines ?? [];
      notifyListeners();
    } catch (ex, stackTrace) {
      debugPrint(ex.toString());
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}
