import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:mplus_app/app/invoices/domain/entities/invoice.dart';
import 'package:mplus_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';

import 'package:mplus_app/app/invoices/data/data_sources/invoice_data_source.dart';
import 'package:mplus_app/app/invoices/data/repositories/invoice_repository_impl.dart';
import 'package:mplus_app/app/invoices/domain/usecases/get_invoices_usecase.dart';
import 'package:mplus_app/app/invoices/presentation/providers/invoice_page_change_notifier.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InvoiceChangeNotifier>(
      create: (_) => InvoiceChangeNotifier(
        getInvoicesUseCase: GetInvoicesUseCase(
          invoiceRepository: InvoiceRepositoryImpl(
            invoiceDataSource: InvoiceDataSourceImpl(),
          ),
        ),
      ),
      builder: (_, __) => const _InvoiceView(),
    );
  }
}

class _InvoiceView extends StatelessWidget {
  const _InvoiceView();

  @override
  Widget build(BuildContext context) {
    context.read<InvoiceChangeNotifier>().init();

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        // gradient: LinearGradient(
        //   colors: [
        //     AppColors.navyBlue,
        //     AppColors.royalBlue,
        //   ],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: RefreshIndicator(
        onRefresh: () => Future.sync(() =>
            context.read<InvoiceChangeNotifier>().pagingController.refresh()),
        child: Scrollbar(
          child: PagedListView<int, Invoice>.separated(
            pagingController:
                context.watch<InvoiceChangeNotifier>().pagingController,
            builderDelegate: PagedChildBuilderDelegate<Invoice>(
              itemBuilder: (_, item, index) => _InvoiceItem(
                invoice: item,
                index: index,
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            padding: const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}

class _InvoiceItem extends StatelessWidget {
  final Invoice _invoice;
  final int _index;
  const _InvoiceItem({super.key, required Invoice invoice, required int index})
      : _invoice = invoice,
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
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invoice Date',
                    style: _headerTextStyle,
                  ),
                  _sGap,
                  Text(
                    _invoice.invoiceDate != null
                        ? DateFormat('dd/MM/yyyy').format(_invoice.invoiceDate!)
                        : '-',
                    style: _dataTextStyle,
                  ),
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
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Invoice No.',
                          style:
                              _headerTextStyle.copyWith(color: Colors.black87),
                        ),
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.top,
                          child: Icon(
                            Icons.copy_rounded,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _sGap,
                  Text(
                    _invoice.id ?? 'pending',
                    style: _dataTextStyle.copyWith(
                      color: AppColors.royalBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _gap,
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Status',
                    style: _headerTextStyle,
                  ),
                  _sGap,
                  _invoice.bpcInvoiceCompletedAt != null
                      ? const Icon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.lightGreen,
                        )
                      : const Icon(
                          FontAwesomeIcons.solidCircleQuestion,
                          color: Colors.amber,
                        ),
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
                        text: 'AX Sales ID',
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
                    _invoice.axSalesId ?? 'pending',
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
                    _invoice.salesRepId ?? '',
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
                    _invoice.customerId ?? '',
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
                    _invoice.invoicingName ?? '',
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
                        .format(_invoice.invoiceAmount),
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
                    'Overdue',
                    textAlign: TextAlign.center,
                    style: _headerTextStyle,
                  ),
                  _sGap,
                  Text(
                    _invoice.overDueDays! < 0
                        ? 'in ${_invoice.overDueDays?.abs()} days'
                        : 'for ${_invoice.overDueDays?.abs()} days',
                    style: _dataTextStyle,
                    textAlign: TextAlign.center,
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
