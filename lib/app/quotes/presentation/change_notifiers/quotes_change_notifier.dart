import 'package:flutter/material.dart';
import 'package:mplus_app/utils/constants/page_config.dart';
import 'package:mplus_app/app/quotes/domain/entities/quote.dart';
import 'package:mplus_app/app/quotes/domain/usecases/get_quotes_usecase.dart';

enum QuotesPageStatus { initial, loading, success, nothing, failed }

enum QuotesListViewStatus { initial, loading, success, failed, max }

class QuotesChangeNotifier extends ChangeNotifier {
  QuotesChangeNotifier({required GetQuotesUseCase getQuotesUseCase})
      : _getQuotesUseCase = getQuotesUseCase;

  final GetQuotesUseCase _getQuotesUseCase;

  var pageStatus = QuotesPageStatus.initial;

  List<Quote> quotes = [];

  Future init() async {
    try {
      pageStatus == QuotesPageStatus.loading;
      notifyListeners();

      if (quotes.isEmpty) {
        quotes = await _getQuotesUseCase.call();
      }

      if (quotes.isEmpty) {
        pageStatus == QuotesPageStatus.nothing;
      } else {
        pageStatus == QuotesPageStatus.success;
      }

      notifyListeners();
    } catch (ex, stack) {
      pageStatus == QuotesPageStatus.failed;
      notifyListeners();

      debugPrint(ex.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

  var listViewStatus = QuotesListViewStatus.initial;
  int page = 0;

  Future handleScroll() async {
    try {
      listViewStatus == QuotesListViewStatus.loading;
      notifyListeners();

      if (quotes.length < PageConfig.defaultPageSize) {
        //No Need to fetch more items
        listViewStatus == QuotesListViewStatus.max;
      } else {
        page += 1;

        final newQuotes = await _getQuotesUseCase.call();

        if (newQuotes.isNotEmpty) {
          quotes.addAll(newQuotes);

          listViewStatus == QuotesListViewStatus.success;
        }
      }

      notifyListeners();
    } catch (ex) {
      listViewStatus == QuotesListViewStatus.failed;
      notifyListeners();

      debugPrint(ex.toString());
    }
  }
}
