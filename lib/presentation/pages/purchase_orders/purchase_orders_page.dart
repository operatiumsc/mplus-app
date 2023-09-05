import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mplus_app/data/data_sources/remote/sales/purchase_orders_data_source.dart';
import 'package:mplus_app/data/repositories/purchase_orders_repository_impl.dart';
import 'package:mplus_app/domain/entities/purchase_order.dart';
import 'package:mplus_app/domain/usecases/sales/get_purchase_orders_usecase.dart';
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

    return Scaffold(
      body: Consumer<PurchaseOrdersChangeNotifier>(
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
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: notifier.purchaseOrders.length,
              itemBuilder: (_, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      const _PurchaseOrderHeader(),
                      _PurchaseOrderItem(
                        purchaseOrder: notifier.purchaseOrders[index],
                      ),
                    ],
                  );
                }
                return _PurchaseOrderItem(
                  purchaseOrder: notifier.purchaseOrders[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}

class _PurchaseOrderHeader extends StatelessWidget {
  const _PurchaseOrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          _gap,
          Expanded(
            flex: 3,
            child: Text(
              'Created Date',
              style: _textStyle,
            ),
          ),
          _gap,
          Expanded(
            child: Text(
              'Status',
              style: _textStyle,
            ),
          ),
          _gap,
          Expanded(
            flex: 2,
            child: Text(
              'AX Sales ID',
              style: _textStyle,
            ),
          ),
          _gap,
          Expanded(
            flex: 2,
            child: Text(
              'Salesperson',
              style: _textStyle,
            ),
          ),
          _gap,
          Expanded(
            flex: 2,
            child: Text(
              'Customer',
              style: _textStyle,
            ),
          ),
          _gap,
          Expanded(
            flex: 8,
            child: Text(
              'Customer Name',
              style: _textStyle,
            ),
          ),
          _gap,
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Total Amount (VAT)',
                style: _textStyle,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          _gap
        ],
      ),
    );
  }

  final _textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  static const _gap = SizedBox(
    width: 8,
    height: 8,
  );
}

class _PurchaseOrderItem extends StatelessWidget {
  final PurchaseOrder _purchaseOrder;
  const _PurchaseOrderItem({super.key, required PurchaseOrder purchaseOrder})
      : _purchaseOrder = purchaseOrder;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        title: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  _purchaseOrder.createdAt != null
                      ? DateFormat('dd/MM/yy HH:mm:ss')
                          .format(_purchaseOrder.createdAt!)
                      : '-',
                ),
              ),
              _gap,
              PurchaseOrderStatusIcon(status: _purchaseOrder.status),
              _gap,
              Expanded(
                flex: 2,
                child: Text(_purchaseOrder.axSalesId ?? ''),
              ),
              _gap,
              Expanded(
                flex: 2,
                child: Text(_purchaseOrder.salesRepId ?? ''),
              ),
              _gap,
              Expanded(
                flex: 2,
                child: Text(_purchaseOrder.customerId ?? ''),
              ),
              _gap,
              Expanded(
                flex: 8,
                child: Text(_purchaseOrder.customerName ?? ''),
              ),
              _gap,
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    NumberFormat.simpleCurrency(locale: 'th-TH')
                        .format(_purchaseOrder.grandTotal),
                  ),
                ),
              ),
            ],
          ),
        ),
        children: const [
          _PurchaseOrderDetails(),
        ],
      ),
    );
  }

  static const _gap = SizedBox(
    width: 8,
    height: 8,
  );
}

class _PurchaseOrderDetails extends StatelessWidget {
  const _PurchaseOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
