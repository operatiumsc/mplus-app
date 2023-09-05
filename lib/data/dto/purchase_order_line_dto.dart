import 'package:mplus_app/domain/entities/purchase_order_line.dart';

class PurchaseOrderLineDTO {
  int? orderId;
  int? lineNum;
  String? itemId;
  String? itemName;
  String? itemClass;
  String? costCenter;
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

  PurchaseOrderLineDTO({
    this.orderId,
    this.lineNum,
    this.itemId,
    this.itemName,
    this.itemClass,
    this.costCenter,
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

  factory PurchaseOrderLineDTO.fromJson(Map<String, dynamic> json) =>
      PurchaseOrderLineDTO(
        orderId: json["orderId"],
        lineNum: json["lineNum"],
        itemId: json["itemId"],
        itemName: json["item"]["name"],
        itemClass: json["item"]["itemClass"],
        costCenter: json["item"]["costCenter"],
        description: json["description"],
        unit: json["unit"],
        quantity: json["quantity"],
        price: json["price"]?.toDouble(),
        disc1: json["disc1"],
        disc2: json["disc2"],
        disc3: json["disc3"],
        lineAmount: json["lineAmount"]?.toDouble(),
        reasonCode: json["reasonCode"],
        lowerPrice: json["lowerPrice"],
        requestedApproval: json["requestedApproval"],
        approved: json["approved"],
        approvedBy: json["approvedBy"],
        approvedAt: DateTime.tryParse(json["approvedAt"] ?? ''),
        payment: json["payment"],
        warehouse: json["warehouse"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "lineNum": lineNum,
        "itemId": itemId,
        "name": itemName,
        "itemClass": itemClass,
        "costCenter": costCenter,
        "description": description,
        "unit": unit,
        "quantity": quantity,
        "price": price,
        "disc1": disc1,
        "disc2": disc2,
        "disc3": disc3,
        "lineAmount": lineAmount,
        "reasonCode": reasonCode,
        "lowerPrice": lowerPrice,
        "requestedApproval": requestedApproval,
        "approved": approved,
        "approvedBy": approvedBy,
        "approvedAt": approvedAt?.toIso8601String(),
        "payment": payment,
        "warehouse": warehouse,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

extension PurchaseOrderLineMapper on PurchaseOrderLineDTO {
  PurchaseOrderLine toEntity() => PurchaseOrderLine(
        orderId: orderId,
        lineNum: lineNum,
        itemId: itemId,
        itemName: itemName,
        itemClass: itemClass,
        costCenter: costCenter,
        description: description,
        unit: unit,
        quantity: quantity,
        price: price,
        disc1: disc1,
        disc2: disc2,
        disc3: disc3,
        lineAmount: lineAmount,
        reasonCode: reasonCode,
        lowerPrice: lowerPrice,
        requestedApproval: requestedApproval,
        approved: approved,
        approvedBy: approvedBy,
        approvedAt: approvedAt,
        payment: payment,
        warehouse: warehouse,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
