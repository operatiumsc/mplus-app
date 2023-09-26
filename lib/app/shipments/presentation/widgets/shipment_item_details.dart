import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../utils/constants/colors.dart';
import '../../domain/entities/shipment.dart';

class ShipmentItemDetails extends StatelessWidget {
  const ShipmentItemDetails({super.key, required Shipment shipment})
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
