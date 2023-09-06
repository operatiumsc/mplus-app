import 'package:mplus_app/domain/entities/purchase_order.dart';

class PurchaseOrderDTO {
  int? id;
  int? subOrderId;
  int? status;
  String? axSalesId;
  int? axSalesStatus;
  bool? isSplitted;
  int? originOrderId;
  bool? isEcom;
  bool? isEcomOriginOrder;
  int? ecomOrderId;
  String? ecomOrderNo;
  double? totalAmount;
  double? totalDiscount;
  double? vat;
  double? grandTotal;
  bool? appliedPromo;
  String? appliedPromoBy;
  DateTime? appliedPromoAt;
  DateTime? confirmedAt;
  String? salesRepId;
  String? salesUnitId;
  String? customerId;
  String? customerGroup;
  String? customerWarehouse;
  String? customerName;
  String? customerAddress;
  String? customerPostalCode;
  String? warehouse;
  bool? isDirectDelivery;
  DateTime? requestShipDate;
  String? shipToName;
  String? shipToAddress;
  String? shipToZipCode;
  String? destinationCode;
  bool? routeG;
  String? paymentTermId;
  String? paymentMode;
  String? creditMemo;
  String? memo1;
  String? memo2;
  String? memo3;
  String? memo4;
  DateTime? createdAt;
  DateTime? updatedAt;

  PurchaseOrderDTO({
    this.id,
    this.subOrderId,
    this.status,
    this.axSalesId,
    this.axSalesStatus,
    this.isSplitted,
    this.originOrderId,
    this.isEcom,
    this.isEcomOriginOrder,
    this.ecomOrderId,
    this.ecomOrderNo,
    this.totalAmount,
    this.totalDiscount,
    this.vat,
    this.grandTotal,
    this.appliedPromo,
    this.appliedPromoBy,
    this.appliedPromoAt,
    this.confirmedAt,
    this.salesRepId,
    this.salesUnitId,
    this.customerId,
    this.customerGroup,
    this.customerWarehouse,
    this.customerName,
    this.customerAddress,
    this.customerPostalCode,
    this.warehouse,
    this.isDirectDelivery,
    this.requestShipDate,
    this.shipToName,
    this.shipToAddress,
    this.shipToZipCode,
    this.destinationCode,
    this.routeG,
    this.paymentTermId,
    this.paymentMode,
    this.creditMemo,
    this.memo1,
    this.memo2,
    this.memo3,
    this.memo4,
    this.createdAt,
    this.updatedAt,
  });

  factory PurchaseOrderDTO.fromJson(Map<String, dynamic> json) =>
      PurchaseOrderDTO(
        id: json["id"],
        subOrderId: json["subOrderId"],
        status: json["status"],
        axSalesId: json["axSalesId"],
        axSalesStatus: json["axSalesStatus"],
        isSplitted: json["isSplitted"],
        originOrderId: json["originOrderId"],
        isEcom: json["isEcom"],
        isEcomOriginOrder: json["isEcomOriginOrder"],
        ecomOrderId: json["ecomOrderId"],
        ecomOrderNo: json["ecomOrderNo"],
        totalAmount: json["totalAmount"]?.toDouble(),
        totalDiscount: json["totalDiscount"]?.toDouble(),
        vat: json["vat"]?.toDouble(),
        grandTotal: json["grandTotal"]?.toDouble(),
        appliedPromo: json["appliedPromo"],
        appliedPromoBy: json["appliedPromoBy"],
        appliedPromoAt: DateTime.tryParse(json["appliedPromoAt"] ?? ''),
        confirmedAt: DateTime.tryParse(json["confirmedAt"] ?? ''),
        salesRepId: json["salesRepId"],
        salesUnitId: json["salesUnitId"],
        customerId: json["customerId"],
        customerGroup: json["customerGroup"],
        customerWarehouse: json["customerWarehouse"],
        customerName: json["customerName"],
        customerAddress: json["customerAddress"],
        customerPostalCode: json["customerPostalCode"],
        warehouse: json["warehouse"],
        isDirectDelivery: json["isDirectDelivery"],
        requestShipDate: DateTime.tryParse(json["requestShipDate"] ?? ''),
        shipToName: json["shipToName"],
        shipToAddress: json["shipToAddress"],
        shipToZipCode: json["shipToZipCode"],
        destinationCode: json["destinationCode"],
        routeG: json["routeG"],
        paymentTermId: json["paymentTermId"],
        paymentMode: json["paymentMode"],
        creditMemo: json["creditMemo"],
        memo1: json["memo1"],
        memo2: json["memo2"],
        memo3: json["memo3"],
        memo4: json["memo4"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subOrderId": subOrderId,
        "status": status,
        "axSalesId": axSalesId,
        "axSalesStatus": axSalesStatus,
        "isSplitted": isSplitted,
        "originOrderId": originOrderId,
        "isEcom": isEcom,
        "isEcomOriginOrder": isEcomOriginOrder,
        "ecomOrderId": ecomOrderId,
        "ecomOrderNo": ecomOrderNo,
        "totalAmount": totalAmount,
        "totalDiscount": totalDiscount,
        "vat": vat,
        "grandTotal": grandTotal,
        "appliedPromo": appliedPromo,
        "appliedPromoBy": appliedPromoBy,
        "appliedPromoAt": appliedPromoAt?.toIso8601String(),
        "confirmedAt": confirmedAt?.toIso8601String(),
        "salesRepId": salesRepId,
        "salesUnitId": salesUnitId,
        "customerId": customerId,
        "customerGroup": customerGroup,
        "customerWarehouse": customerWarehouse,
        "customerName": customerName,
        "customerAddress": customerAddress,
        "customerPostalCode": customerPostalCode,
        "warehouse": warehouse,
        "isDirectDelivery": isDirectDelivery,
        "requestShipDate": requestShipDate?.toIso8601String(),
        "shipToName": shipToName,
        "shipToAddress": shipToAddress,
        "shipToZipCode": shipToZipCode,
        "destinationCode": destinationCode,
        "routeG": routeG,
        "paymentTermId": paymentTermId,
        "paymentMode": paymentMode,
        "creditMemo": creditMemo,
        "memo1": memo1,
        "memo2": memo2,
        "memo3": memo3,
        "memo4": memo4,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

extension PurchaseOrderMapper on PurchaseOrderDTO {
  PurchaseOrder toEntity() => PurchaseOrder(
        id: id,
        subOrderId: subOrderId,
        status: status,
        axSalesId: axSalesId,
        axSalesStatus: axSalesStatus,
        isSplitted: isSplitted,
        originOrderId: originOrderId,
        isEcom: isEcom,
        isEcomOriginOrder: isEcomOriginOrder,
        ecomOrderId: ecomOrderId,
        ecomOrderNo: ecomOrderNo,
        totalAmount: totalAmount,
        totalDiscount: totalDiscount,
        vat: vat,
        grandTotal: grandTotal,
        appliedPromo: appliedPromo,
        appliedPromoBy: appliedPromoBy,
        appliedPromoAt: appliedPromoAt,
        confirmedAt: confirmedAt,
        salesRepId: salesRepId,
        salesUnitId: salesUnitId,
        customerId: customerId,
        customerGroup: customerGroup,
        customerWarehouse: customerWarehouse,
        customerName: customerName,
        customerAddress: customerAddress,
        customerPostalCode: customerPostalCode,
        warehouse: warehouse,
        isDirectDelivery: isDirectDelivery,
        requestShipDate: requestShipDate,
        shipToName: shipToName,
        shipToAddress: shipToAddress,
        shipToZipCode: shipToZipCode,
        destinationCode: destinationCode,
        routeG: routeG,
        paymentTermId: paymentTermId,
        paymentMode: paymentMode,
        creditMemo: creditMemo,
        memo1: memo1,
        memo2: memo2,
        memo3: memo3,
        memo4: memo4,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
