class PurchaseOrderLine {
  int? orderId;
  int? lineNum;
  String? itemId;
  String? description;
  String? unit;
  int? quantity;
  double? price;
  int? disc1;
  int? disc2;
  int? disc3;
  double? lineAmount;
  String? reasonCode;
  bool? lowerPrice;
  bool? requestedApproval;
  bool? approved;
  String? approvedBy;
  DateTime? approvedAt;
  String? payment;
  String? warehouse;
  DateTime? createdAt;
  DateTime? updatedAt;

  PurchaseOrderLine({
    this.orderId,
    this.lineNum,
    this.itemId,
    this.description,
    this.unit,
    this.quantity,
    this.price,
    this.disc1,
    this.disc2,
    this.disc3,
    this.lineAmount,
    this.reasonCode,
    this.lowerPrice,
    this.requestedApproval,
    this.approved,
    this.approvedBy,
    this.approvedAt,
    this.payment,
    this.warehouse,
    this.createdAt,
    this.updatedAt,
  });
}
