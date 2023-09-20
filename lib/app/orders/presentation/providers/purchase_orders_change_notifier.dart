import 'package:flutter/material.dart';
import 'package:mplus_app/app/orders/domain/entities/purchase_order.dart';
import 'package:mplus_app/app/orders/domain/entities/purchase_order_line.dart';
import 'package:mplus_app/app/orders/domain/usecases/get_purchase_order_lines_usecase.dart';
import 'package:mplus_app/app/orders/domain/usecases/get_purchase_orders_usecase.dart';

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
  bool get isLoading =>
      purchaseOrderViewStatus == PurchaseOrderViewStatus.loading;
  bool get isSuccess =>
      purchaseOrderViewStatus == PurchaseOrderViewStatus.success;
  bool get isFailed =>
      purchaseOrderViewStatus == PurchaseOrderViewStatus.failed;

  Future<List<PurchaseOrder>>? futurePurchaseOrders;
  List<PurchaseOrder> purchaseOrders = [];
  int pageIndex = 0;

  Future<void> initPage() async {
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

  Future<void> refreshPage() async {
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

  Future<void> handleScroll() async {
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

  Future<void> expandOrder({required int orderId}) async {
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
