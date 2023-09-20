import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:mplus_app/app/orders/presentation/widgets/purchase_order_status_icon.dart';
import 'package:mplus_app/app/quotes/domain/entities/quote.dart';
import 'package:mplus_app/app/quotes/domain/repositories/quotes_repository.dart';
import 'package:mplus_app/app/quotes/domain/usecases/get_quotes_usecase.dart';
import 'package:mplus_app/app/quotes/presentation/change_notifiers/quotes_change_notifier.dart';
import 'package:mplus_app/injection.dart';
import 'package:mplus_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuotesChangeNotifier(
        getQuotesUseCase: GetQuotesUseCase(
          quotesRepository: service.get<QuotesRepository>(),
        ),
      ),
      builder: (_, __) => const QuotesView(),
    );
  }
}

class QuotesView extends HookWidget {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset ==
              scrollController.position.maxScrollExtent &&
          context.watch<QuotesChangeNotifier>().listViewStatus !=
              QuotesListViewStatus.loading) {
        context.read<QuotesChangeNotifier>().handleScroll();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuotesChangeNotifier>().init();
    });

    return Consumer<QuotesChangeNotifier>(
      builder: (_, notifier, __) {
        if (notifier.pageStatus == QuotesPageStatus.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(AppColors.royalBlue),
            ),
          );
        } else if (notifier.pageStatus == QuotesPageStatus.failed) {
          return const Text('err');
        } else {
          return Scrollbar(
            child: Container(
              color: Colors.grey.shade300,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: notifier.quotes.length,
                itemBuilder: (_, index) => _QuoteItem(
                  index: index,
                  quote: notifier.quotes[index],
                ),
                separatorBuilder: (_,__) => const SizedBox(height: 8),
              ),
            ),
          );
        }
      },
    );
  }
}

class _QuoteItem extends StatelessWidget {
  final Quote _quote;
  final int _index;
  const _QuoteItem({super.key, required Quote quote, required int index})
      : _quote = quote,
        _index = index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Date',
                    style: _headerTextStyle,
                  ),
                  _sGap,
                  Text(
                    _quote.createdAt != null
                        ? DateFormat('dd/MM/yyyy HH:mm:ss')
                            .format(_quote.createdAt!)
                        : '-',
                    style: _dataTextStyle,
                  ),
                ],
              ),
            ),
            // _gap,
            // Expanded(
            //   flex: 3,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       RichText(
            //         text: TextSpan(
            //           children: [
            //             TextSpan(
            //               text: 'Quote No.',
            //               style:
            //                   _headerTextStyle.copyWith(color: Colors.black87),
            //             ),
            //             const WidgetSpan(
            //               alignment: PlaceholderAlignment.top,
            //               child: Icon(
            //                 Icons.copy_rounded,
            //                 size: 16,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       _sGap,
            //       Text(
            //         _quote.id ?? 'pending',
            //         style: _dataTextStyle.copyWith(
            //           color: AppColors.royalBlue,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            _gap,
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Status',
                    style: _headerTextStyle,
                  ),
                  _sGap,
                  PurchaseOrderStatusIcon(status: _quote.status),
                ],
              ),
            ),
            _gap,
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'AX Quote ID',
                        style: _headerTextStyle.copyWith(color: Colors.black87),
                      ),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child: Icon(
                          Icons.copy_rounded,
                          size: 16,
                        ),
                      ),
                    ]),
                  ),
                  _sGap,
                  Text(
                    _quote.axQuotationId ?? 'pending',
                    style: _dataTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            _gap,
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    'Salesperson',
                    style: _headerTextStyle,
                  ),
                  _sGap,
                  Text(
                    _quote.salesRepId ?? '',
                    style: _dataTextStyle,
                  ),
                ],
              ),
            ),
            _gap,
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    'Customer',
                    style: _headerTextStyle,
                  ),
                  _sGap,
                  Text(
                    _quote.customerId ?? '',
                    style: _dataTextStyle,
                  ),
                ],
              ),
            ),
            _gap,
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer Name',
                    style: _headerTextStyle,
                  ),
                  _sGap,
                  Text(
                    _quote.customerName ?? '',
                    style: _dataTextStyle,
                  ),
                ],
              ),
            ),
            _gap,
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Total Amount (VAT)',
                    style: _headerTextStyle,
                  ),
                  _sGap,
                  Text(
                    NumberFormat.currency(locale: 'th-TH', symbol: '')
                        .format(_quote.grandTotal),
                    style: _dataTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const _sGap = SizedBox(
    width: 4,
    height: 4,
  );

  static const _gap = SizedBox(
    width: 8,
    height: 8,
  );

  final _headerTextStyle =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  final _dataTextStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
}
