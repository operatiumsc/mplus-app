import 'package:mplus_app/app/shipments/data/dto/shipment_dto.dart';

class Shipment {
  String? salesId;
  String? customerId;
  String? salesPersonId;
  String? invoiceId;
  DateTime? invoiceDate;
  String? invoicingName;
  String? invoicingAddress;
  String? invoicingZipCode;
  String? shipToName;
  String? shipToAddress;
  String? destinationCode;
  double? latitude;
  double? longitude;
  DateTime? shipmentConfirmedAt;
  String? shipmentConfirmedBy;
  String? warehouse;
  String? vehicleId;
  String? driverId;
  DateTime? driverConfirmedAt;
  DateTime? customerRecievedAt;
  int? status;

  Shipment({
    this.salesId,
    this.customerId,
    this.salesPersonId,
    this.invoiceId,
    this.invoiceDate,
    this.invoicingName,
    this.invoicingAddress,
    this.invoicingZipCode,
    this.shipToName,
    this.shipToAddress,
    this.destinationCode,
    this.latitude,
    this.longitude,
    this.shipmentConfirmedAt,
    this.shipmentConfirmedBy,
    this.warehouse,
    this.vehicleId,
    this.driverId,
    this.driverConfirmedAt,
    this.customerRecievedAt,
    this.status,
  });
}

extension ShipmentMapper on Shipment {
  ShipmentDTO toModel() => ShipmentDTO(
        salesId: salesId,
        customerId: customerId,
        salesPersonId: salesPersonId,
        invoiceId: invoiceId,
        invoiceDate: invoiceDate,
        invoicingName: invoicingName,
        invoicingAddress: invoicingAddress,
        invoicingZipCode: invoicingZipCode,
        shipToName: shipToName,
        shipToAddress: shipToAddress,
        destinationCode: destinationCode,
        latitude: latitude,
        longitude: longitude,
        shipmentConfirmedAt: shipmentConfirmedAt,
        shipmentConfirmedBy: shipmentConfirmedBy,
        warehouse: warehouse,
        vehicleId: vehicleId,
        driverId: driverId,
        driverConfirmedAt: driverConfirmedAt,
        customerRecievedAt: customerRecievedAt,
        status: status,
      );
}
