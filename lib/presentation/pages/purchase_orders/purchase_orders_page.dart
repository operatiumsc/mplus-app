import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:mplus_app/data/data_sources/remote/sales/purchase_orders_data_source.dart';
import 'package:mplus_app/data/repositories/purchase_orders_repository_impl.dart';
import 'package:mplus_app/domain/entities/purchase_order.dart';
import 'package:mplus_app/domain/entities/purchase_order_line.dart';
import 'package:mplus_app/domain/usecases/sales/get_purchase_order_lines_usecase.dart';
import 'package:mplus_app/domain/usecases/sales/get_purchase_orders_usecase.dart';
import 'package:mplus_app/presentation/colors.dart';
import 'package:mplus_app/presentation/pages/purchase_orders/purchase_orders_change_notifier.dart';
import 'package:mplus_app/presentation/widgets/purchase_order_status_icon.dart';
import 'package:provider/provider.dart';

class PurchaseOrdersPage extends StatelessWidget {
  const PurchaseOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PurchaseOrdersChangeNotifier>(
      create: (_) => PurchaseOrdersChangeNotifier(
        getPurchaseOrdersUseCase: GetPurchaseOrdersUseCase(
          purchaseOrdersRepository: PurchaseOrdersRepositoryImpl(
            purchaseOrdersDataSource: PurchaseOrdersDataSourceImpl(),
          ),
        ),
        getPurchaseOrderLinesUseCase: GetPurchaseOrderLinesUseCase(
          purchaseOrdersRepository: PurchaseOrdersRepositoryImpl(
            purchaseOrdersDataSource: PurchaseOrdersDataSourceImpl(),
          ),
        ),
      ),
      builder: (_, __) => const _PurchaseOrdersView(),
    );
  }
}

class _PurchaseOrdersView extends HookWidget {
  const _PurchaseOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PurchaseOrdersChangeNotifier>().onInit();
    });

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF003B73),
            Color(0xFF0074B7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Consumer<PurchaseOrdersChangeNotifier>(
        builder: (_, notifier, __) {
          if (notifier.purchaseOrderViewStatus ==
              PurchaseOrderViewStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (notifier.purchaseOrderViewStatus ==
              PurchaseOrderViewStatus.failed) {
            return const Text('error');
          } else {
            return RefreshIndicator.adaptive(
              onRefresh: () => notifier.onRefreshedPage(),
              child: Scrollbar(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: notifier.purchaseOrders.length,
                  itemBuilder: (_, index) {
                    return _PurchaseOrderItem(
                      purchaseOrder: notifier.purchaseOrders[index],
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _PurchaseOrderItem extends StatelessWidget {
  final PurchaseOrder _purchaseOrder;
  const _PurchaseOrderItem({super.key, required PurchaseOrder purchaseOrder})
      : _purchaseOrder = purchaseOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          backgroundColor: AppColors.royalBlue,
          onExpansionChanged: (isExpanded) {
            if (isExpanded) {
              context
                  .read<PurchaseOrdersChangeNotifier>()
                  .onExpandedOrder(orderId: _purchaseOrder.id!);
            }
          },
          title: Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Created Date',
                        style: _headerTextStyle,
                      ),
                    ),
                    _gap,
                    Expanded(
                      child: Center(
                        child: Text(
                          'Status',
                          style: _headerTextStyle,
                        ),
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 3,
                      child: Text(
                        'AX Sales ID',
                        style: _headerTextStyle,
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Salesperson',
                        style: _headerTextStyle,
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Customer',
                        style: _headerTextStyle,
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 8,
                      child: Text(
                        'Customer Name',
                        style: _headerTextStyle,
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Total Amount (VAT)',
                          style: _headerTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                _gap,
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        _purchaseOrder.createdAt != null
                            ? DateFormat('dd/MM/yy HH:mm:ss')
                                .format(_purchaseOrder.createdAt!)
                            : '-',
                        style: _dataTextStyle,
                      ),
                    ),
                    _gap,
                    Expanded(
                      child: PurchaseOrderStatusIcon(
                        status: _purchaseOrder.status,
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 3,
                      child: Text(
                        _purchaseOrder.axSalesId ?? 'pending',
                        style: _dataTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 2,
                      child: Text(
                        _purchaseOrder.salesRepId ?? '',
                        style: _dataTextStyle,
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 2,
                      child: Text(
                        _purchaseOrder.customerId ?? '',
                        style: _dataTextStyle,
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 8,
                      child: Text(
                        _purchaseOrder.customerName ?? '',
                        style: _dataTextStyle,
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          NumberFormat.simpleCurrency(locale: 'th-TH')
                              .format(_purchaseOrder.grandTotal),
                          style: _dataTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          children: const [
            _PurchaseOrderDetails(),
          ],
        ),
      ),
    );
  }

  static const _gap = SizedBox(
    width: 8,
    height: 8,
  );

  final _headerTextStyle = const TextStyle(
      color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);
  final _dataTextStyle = const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal);
}

class _PurchaseOrderDetails extends StatelessWidget {
  const _PurchaseOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseOrdersChangeNotifier>(
      builder: (_, notifier, __) {
        return FutureBuilder<List<PurchaseOrderLine>>(
          future: notifier.futurePurchaseOrderLines,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Some errors occured.');
            } else if (snapshot.hasData) {
              // return ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: snapshot.data?.length,
              //   itemBuilder: (_, index) {
              //     return ListTile(
              //       title: Text(snapshot.data?[index].itemName ?? ''),
              //     );
              //   },
              // );

              return _PurchaseOrderLineItem(
                purchaseOrderLines: snapshot.data!,
              );
            } else {
              return const Center(
                child: LinearProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}

class _PurchaseOrderLineItem extends StatelessWidget {
  final List<PurchaseOrderLine> _purchaseOrderLines;
  const _PurchaseOrderLineItem(
      {super.key, required List<PurchaseOrderLine> purchaseOrderLines})
      : _purchaseOrderLines = purchaseOrderLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.75),
      width: double.infinity,
      child: DataTable(
          columnSpacing: 8,
          headingTextStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          columns: const [
            DataColumn(label: Text('No.')),
            DataColumn(label: Text('Class')),
            DataColumn(label: Text('Agency')),
            DataColumn(label: Text('Item Id')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Unit')),
            DataColumn(label: Text('Qty')),
            DataColumn(label: Text('Price')),
            DataColumn(label: Text('Reason')),
            DataColumn(label: Text('%Disc 1')),
            DataColumn(label: Text('%Disc 2')),
            DataColumn(label: Text('%Disc 3')),
            DataColumn(
              label: Align(
                alignment: Alignment.centerRight,
                child: Text('Amount'),
              ),
            ),
            DataColumn(label: Text('Lower\nPrice')),
          ],
          rows: _purchaseOrderLines
              .map((e) => DataRow(cells: [
                    DataCell(
                      Text('${e.lineNum}'),
                    ),
                    DataCell(
                      Text('${e.itemClass}'),
                    ),
                    DataCell(Text('${e.costCenter}')),
                    DataCell(Text('${e.itemId}')),
                    DataCell(
                      Container(
                        alignment: Alignment.centerLeft,
                        constraints: const BoxConstraints.expand(),
                        child: Text(
                          '${e.itemName}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    DataCell(Text('${e.unit}')),
                    DataCell(Text('${e.quantity}')),
                    DataCell(
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          NumberFormat.currency(locale: 'th-TH', symbol: '')
                              .format(e.price),
                        ),
                      ),
                    ),
                    DataCell(Text('${e.reasonCode}')),
                    DataCell(Text('${e.disc1}')),
                    DataCell(Text('${e.disc2}')),
                    DataCell(Text('${e.disc3}')),
                    DataCell(
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          NumberFormat.currency(locale: 'th-TH', symbol: '')
                              .format(e.lineAmount),
                        ),
                      ),
                    ),
                    DataCell(
                      Checkbox.adaptive(
                        value: e.approved,
                        onChanged: null,
                      ),
                    ),
                  ]))
              .toList()),
    );
  }
}
