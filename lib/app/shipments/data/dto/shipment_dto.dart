import 'package:mplus_app/app/shipments/domain/entities/shipment.dart';

class ShipmentDTO {
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

  ShipmentDTO({
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

  factory ShipmentDTO.fromJson(Map<String, dynamic> json) => ShipmentDTO(
        salesId: json["salesId"],
        customerId: json["customerId"],
        salesPersonId: json["salesPersonId"],
        invoiceId: json["invoiceId"],
        invoiceDate: DateTime.tryParse(json["invoiceDate"] ?? ''),
        invoicingName: json["invoicingName"],
        invoicingAddress: json["invoicingAddress"],
        invoicingZipCode: json["invoicingZipCode"],
        shipToName: json["shipToName"],
        shipToAddress: json["shipToAddress"],
        destinationCode: json["destinationCode"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        shipmentConfirmedAt:
            DateTime.tryParse(json["shipmentConfirmedAt"] ?? ''),
        shipmentConfirmedBy: json["shipmentConfirmedBy"],
        warehouse: json["warehouse"],
        vehicleId: json["vehicleId"],
        driverId: json["driverId"],
        driverConfirmedAt: DateTime.tryParse(json["driverConfirmedAt"] ?? ''),
        customerRecievedAt: DateTime.tryParse(json["customerRecievedAt"] ?? ''),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "salesId": salesId,
        "customerId": customerId,
        "salesPersonId": salesPersonId,
        "invoiceId": invoiceId,
        "invoiceDate": invoiceDate?.toIso8601String(),
        "invoicingName": invoicingName,
        "invoicingAddress": invoicingAddress,
        "invoicingZipCode": invoicingZipCode,
        "shipToName": shipToName,
        "shipToAddress": shipToAddress,
        "destinationCode": destinationCode,
        "latitude": latitude,
        "longitude": longitude,
        "shipmentConfirmedAt": shipmentConfirmedAt?.toIso8601String(),
        "shipmentConfirmedBy": shipmentConfirmedBy,
        "warehouse": warehouse,
        "vehicleId": vehicleId,
        "driverId": driverId,
        "driverConfirmedAt": driverConfirmedAt?.toIso8601String(),
        "customerRecievedAt": customerRecievedAt?.toIso8601String(),
        "status": status,
      };
}

extension ShipmentMapper on ShipmentDTO {
  Shipment toEntity() => Shipment(
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
