import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../utils/constants/colors.dart';
import '../../domain/entities/shipment.dart';
import '../change_notifers/shipments_change_notifier.dart';

class ShipmentsView extends StatelessWidget {
  const ShipmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset ==
              scrollController.position.maxScrollExtent &&
          context.watch<ShipmentsChangeNotifier>().listViewStatus !=
              ShipmentsListViewStatus.loading) {
        context.read<ShipmentsChangeNotifier>().handleScroll();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ShipmentsChangeNotifier>().init();
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
      child: Consumer<ShipmentsChangeNotifier>(
        builder: (_, notifier, __) {
          if (notifier.pageStatus == ShipmentsPageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          } else if (notifier.pageStatus == ShipmentsPageStatus.failed) {
            return const Text('err');
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8.0,
                    children: [
                      FilterChip(
                        selected: true,
                        label: Text('Currently deliver'),
                        selectedColor: Colors.lightGreen,
                        onSelected: (isSelected) {},
                      ),
                      FilterChip(
                        selected: false,
                        label: Text('Completed'),
                        onSelected: (isSelected) {},
                      ),
                      Chip(
                        avatar: Icon(FontAwesomeIcons.locationCrosshairs),
                        label: const Text('Order by the nearest me'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: notifier.shipments.length,
                      itemBuilder: (_, index) => _ShipmentListItem(
                        index: index,
                        shipment: notifier.shipments[index],
                      ),
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class _ShipmentListItem extends StatelessWidget {
  final Shipment _shipment;
  final int _index;
  const _ShipmentListItem(
      {super.key, required Shipment shipment, required int index})
      : _shipment = shipment,
        _index = index;

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
          collapsedTextColor: Colors.white,
          textColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            _shipment.invoiceDate != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(_shipment.invoiceDate!)
                                : '-',
                            style: _dataTextStyle,
                          ),
                        ],
                      ),
                    ),
                    _gap,
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Sales ID',
                                style: _headerTextStyle.copyWith(
                                  color: Colors.white,
                                ),
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
                            _shipment.salesId ?? 'pending',
                            style: _dataTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
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
                            _shipment.salesPersonId ?? '',
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
                            _shipment.customerId ?? '',
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
                            _shipment.invoicingName ?? '',
                            style: _dataTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          children: [
            _ShipmentItemDetails(
              shipment: _shipment,
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

class _ShipmentItemDetails extends StatelessWidget {
  const _ShipmentItemDetails({super.key, required Shipment shipment})
      : _shipment = shipment;

  final Shipment _shipment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.75),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('Customer Address'),
                  subtitle: Text(
                    _shipment.invoicingAddress ?? '',
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Shipping Address'),
                  subtitle: Text(
                    _shipment.shipToAddress ?? '',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Icon(
                      FontAwesomeIcons.warehouse,
                      color: AppColors.royalBlue,
                    ),
                    _sGap,
                    const Text('Ready for Picking'),
                    _sGap,
                    Text(
                      'WH${_shipment.warehouse}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Divider(
                      thickness: 2,
                      color: _shipment.shipmentConfirmedAt != null
                          ? AppColors.blueGrotto
                          : Colors.grey,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.clipboardCheck,
                      color: _shipment.shipmentConfirmedAt != null
                          ? AppColors.royalBlue
                          : Colors.grey,
                    ),
                    _sGap,
                    const Text('Delivery Confirmed'),
                    Text('by ${_shipment.shipmentConfirmedBy}'),
                    _shipment.shipmentConfirmedAt != null
                        ? Text(DateFormat('dd/MM/yyyy HH:mm:ss')
                            .format(_shipment.shipmentConfirmedAt!.toLocal()))
                        : const SizedBox(),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Divider(
                      thickness: 2,
                      color: _shipment.driverConfirmedAt != null
                          ? AppColors.blueGrotto
                          : Colors.grey,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.truckFast,
                      color: _shipment.driverConfirmedAt != null
                          ? AppColors.royalBlue
                          : Colors.grey,
                    ),
                    _sGap,
                    const Text('Out for delivery'),
                    _sGap,
                    Text('by ${_shipment.vehicleId}'),
                    _shipment.driverConfirmedAt != null
                        ? Text(DateFormat('dd/MM/yyyy HH:mm:ss')
                            .format(_shipment.driverConfirmedAt!.toLocal()))
                        : const SizedBox(),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Divider(
                      thickness: 2,
                      color: _shipment.customerRecievedAt != null
                          ? AppColors.blueGrotto
                          : Colors.grey,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.userCheck,
                      color: _shipment.customerRecievedAt != null
                          ? AppColors.royalBlue
                          : Colors.grey,
                    ),
                    _sGap,
                    Text(
                      'Customer recieved',
                      style: TextStyle(
                        color: _shipment.customerRecievedAt != null
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    _sGap,
                    _shipment.customerRecievedAt != null
                        ? Text(DateFormat('dd/MM/yyyy HH:mm:ss')
                            .format(_shipment.customerRecievedAt!.toLocal()))
                        : const SizedBox(),
                  ],
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Divider(
                      thickness: 2,
                      color: AppColors.blueGrotto,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidCircleCheck,
                      color: _shipment.customerRecievedAt != null
                          ? Colors.green
                          : Colors.grey,
                    ),
                    _sGap,
                    const Text('Completed'),
                    _sGap,
                    _shipment.customerRecievedAt != null
                        ? Text(DateFormat('dd/MM/yyyy HH:mm:ss')
                            .format(_shipment.customerRecievedAt!.toLocal()))
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
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
}
