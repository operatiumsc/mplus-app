class PurchaseOrder {
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

  PurchaseOrder({
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
}
