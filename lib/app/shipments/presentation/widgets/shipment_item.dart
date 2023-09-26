import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/constants/colors.dart';
import '../../domain/entities/shipment.dart';
import 'shipment_item_details.dart';

class ShipmentItem extends StatelessWidget {
  final Shipment _shipment;
  const ShipmentItem({super.key, required Shipment shipment})
      : _shipment = shipment;

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
            ShipmentItemDetails(
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
