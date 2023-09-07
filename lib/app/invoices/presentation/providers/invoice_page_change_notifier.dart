import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mplus_app/app/invoices/domain/entities/invoice.dart';
import 'package:mplus_app/app/invoices/domain/usecases/get_invoices_usecase.dart';
import 'package:mplus_app/app/invoices/presentation/config.dart';

enum InvoicePageStatus { initial, loading, success, failed }

class InvoiceChangeNotifier extends ChangeNotifier {
  final GetInvoicesUseCase _getInvoicesUseCase;

  InvoiceChangeNotifier({
    required GetInvoicesUseCase getInvoicesUseCase,
  }) : _getInvoicesUseCase = getInvoicesUseCase;

  var invoicePageStatus = InvoicePageStatus.initial;
  final pagingController = PagingController<int, Invoice>(firstPageKey: 0);

  Future<List<Invoice>>? futureInvoices;
  List<Invoice> invoices = [];

  void init() {
    pagingController.addPageRequestListener((pageKey) {
      getInvoices(pageKey);
    });
  }

  Future<void> getInvoices(int page) async {
    try {
      final newInvoices = await _getInvoicesUseCase.call(page: page);

      final isLastPage = newInvoices.length < PageConfig.pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(newInvoices);
      } else {
        page += 1;
        pagingController.appendPage(newInvoices, page);
      }

      notifyListeners();
    } catch (ex, stackTrace) {
      pagingController.error = ex;
      notifyListeners();

      debugPrint(ex.toString());
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}
