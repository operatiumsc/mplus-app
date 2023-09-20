import 'package:flutter/material.dart';
import 'package:mplus_app/app/invoices/presentation/config.dart';
import 'package:mplus_app/app/shipments/domain/entities/shipment.dart';
import 'package:mplus_app/app/shipments/domain/usecases/get_shipments_usecase.dart';

enum ShipmentsPageStatus { initial, loading, success, nothing, failed }

enum ShipmentsListViewStatus { initial, loading, success, failed, max }

class ShipmentsChangeNotifier extends ChangeNotifier {
  ShipmentsChangeNotifier({
    required GetShipmentsUseCase getShipmentsUseCase,
  }) : _getShipmentsUseCase = getShipmentsUseCase;

  final GetShipmentsUseCase _getShipmentsUseCase;

  var pageStatus = ShipmentsPageStatus.initial;

  List<Shipment> shipments = [];

  Future init() async {
    try {
      pageStatus == ShipmentsPageStatus.loading;
      notifyListeners();

      if (shipments.isEmpty) {
        shipments = await _getShipmentsUseCase.call();
      }

      if (shipments.isEmpty) {
        pageStatus == ShipmentsPageStatus.nothing;
      } else {
        pageStatus == ShipmentsPageStatus.success;
      }

      notifyListeners();
    } catch (ex, stack) {
      pageStatus == ShipmentsPageStatus.failed;
      notifyListeners();

      debugPrint(ex.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

  var listViewStatus = ShipmentsListViewStatus.initial;

  int page = 0;

  Future handleScroll() async {
    try {
      listViewStatus == ShipmentsListViewStatus.loading;
      notifyListeners();

      if (shipments.length < PageConfig.pageSize) {
        //No Need to fetch more items
        listViewStatus == ShipmentsListViewStatus.max;
      } else {
        page += 1;
        final newQuotes = await _getShipmentsUseCase.call(page: page);

        if (newQuotes.isNotEmpty) {
          shipments.addAll(newQuotes);

          listViewStatus == ShipmentsListViewStatus.success;
        }
      }

      notifyListeners();
    } catch (ex) {
      listViewStatus == ShipmentsListViewStatus.failed;
      notifyListeners();

      debugPrint(ex.toString());
    }
  }
}
