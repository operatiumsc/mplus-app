import '../../domain/entities/quote.dart';

class QuoteDTO {
  String? id;
  String? uuid;
  String? axQuotationId;
  String? axStatusId;
  String? businessId;
  String? businessName;
  String? customerId;
  String? customerName;
  String? customerGroup;
  String? customerTaxGroup;
  String? customerAddress;
  String? customerZipCode;
  String? contactId;
  String? contactName;
  String? contactFax;
  String? contactEmail;
  String? salesRepId;
  String? salesUnitId;
  double? totalAmount;
  double? totalDiscountPercent;
  double? totalDiscount;
  double? vat;
  double? grandTotal;
  String? warehouse;
  DateTime? requestShipDate;
  String? shipToName;
  String? shipToAddress;
  String? shipToZipCode;
  String? destinationCode;
  bool? routeG;
  String? paymentTermId;
  String? paymentMode;
  String? memo1;
  String? memo2;
  String? memo3;
  String? memo4;
  int? status;
  bool? sendFax;
  bool? sendEmail;
  bool? deleted;
  DateTime? confirmedAt;
  DateTime? expiredAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  QuoteDTO({
    this.id,
    this.uuid,
    this.axQuotationId,
    this.axStatusId,
    this.businessId,
    this.businessName,
    this.customerId,
    this.customerName,
    this.customerGroup,
    this.customerTaxGroup,
    this.customerAddress,
    this.customerZipCode,
    this.contactId,
    this.contactName,
    this.contactFax,
    this.contactEmail,
    this.salesRepId,
    this.salesUnitId,
    this.totalAmount,
    this.totalDiscountPercent,
    this.totalDiscount,
    this.vat,
    this.grandTotal,
    this.warehouse,
    this.requestShipDate,
    this.shipToName,
    this.shipToAddress,
    this.shipToZipCode,
    this.destinationCode,
    this.routeG,
    this.paymentTermId,
    this.paymentMode,
    this.memo1,
    this.memo2,
    this.memo3,
    this.memo4,
    this.status,
    this.sendFax,
    this.sendEmail,
    this.deleted,
    this.confirmedAt,
    this.expiredAt,
    this.createdAt,
    this.updatedAt,
  });

  factory QuoteDTO.fromJson(Map<String, dynamic> json) => QuoteDTO(
        id: json["id"].toString(),
        uuid: json["uuid"],
        axQuotationId: json["axQuotationId"],
        axStatusId: json["axStatusId"],
        businessId: json["businessId"],
        businessName: json["businessName"],
        customerId: json["customerId"],
        customerName: json["customerName"],
        customerGroup: json["customerGroup"],
        customerTaxGroup: json["customerTaxGroup"],
        customerAddress: json["customerAddress"],
        customerZipCode: json["customerZipCode"],
        contactId: json["contactId"],
        contactName: json["contactName"],
        contactFax: json["contactFax"],
        contactEmail: json["contactEmail"],
        salesRepId: json["salesRepId"],
        salesUnitId: json["salesUnitId"],
        totalAmount: json["totalAmount"]?.toDouble(),
        totalDiscountPercent: json["totalDiscountPercent"]?.toDouble(),
        totalDiscount: json["totalDiscount"]?.toDouble(),
        vat: json["vat"]?.toDouble(),
        grandTotal: json["grandTotal"]?.toDouble(),
        warehouse: json["warehouse"],
        requestShipDate: DateTime.tryParse(json["requestShipDate"] ?? ''),
        shipToName: json["shipToName"],
        shipToAddress: json["shipToAddress"],
        shipToZipCode: json["shipToZipCode"],
        destinationCode: json["destinationCode"],
        routeG: json["routeG"],
        paymentTermId: json["paymentTermId"],
        paymentMode: json["paymentMode"],
        memo1: json["memo1"],
        memo2: json["memo2"],
        memo3: json["memo3"],
        memo4: json["memo4"],
        status: json["status"],
        sendFax: json["sendFax"],
        sendEmail: json["sendEmail"],
        deleted: json["deleted"],
        confirmedAt: DateTime.tryParse(json["confirmedAt"] ?? ''),
        expiredAt: DateTime.tryParse(json["expiredAt"] ?? ''),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "axQuotationId": axQuotationId,
        "axStatusId": axStatusId,
        "businessId": businessId,
        "businessName": businessName,
        "customerId": customerId,
        "customerName": customerName,
        "customerGroup": customerGroup,
        "customerTaxGroup": customerTaxGroup,
        "customerAddress": customerAddress,
        "customerZipCode": customerZipCode,
        "contactId": contactId,
        "contactName": contactName,
        "contactFax": contactFax,
        "contactEmail": contactEmail,
        "salesRepId": salesRepId,
        "salesUnitId": salesUnitId,
        "totalAmount": totalAmount,
        "totalDiscountPercent": totalDiscountPercent,
        "totalDiscount": totalDiscount,
        "vat": vat,
        "grandTotal": grandTotal,
        "warehouse": warehouse,
        "requestShipDate": requestShipDate?.toIso8601String(),
        "shipToName": shipToName,
        "shipToAddress": shipToAddress,
        "shipToZipCode": shipToZipCode,
        "destinationCode": destinationCode,
        "routeG": routeG,
        "paymentTermId": paymentTermId,
        "paymentMode": paymentMode,
        "memo1": memo1,
        "memo2": memo2,
        "memo3": memo3,
        "memo4": memo4,
        "status": status,
        "sendFax": sendFax,
        "sendEmail": sendEmail,
        "deleted": deleted,
        "confirmedAt": confirmedAt?.toIso8601String(),
        "expiredAt": expiredAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

extension QuoteMapper on QuoteDTO {
  Quote toEntity() => Quote(
        id: id,
        uuid: uuid,
        axQuotationId: axQuotationId,
        axStatusId: axStatusId,
        businessId: businessId,
        businessName: businessName,
        customerId: customerId,
        customerName: customerName,
        customerGroup: customerGroup,
        customerTaxGroup: customerTaxGroup,
        customerAddress: customerAddress,
        customerZipCode: customerZipCode,
        contactId: contactId,
        contactName: contactName,
        contactFax: contactFax,
        contactEmail: contactEmail,
        salesRepId: salesRepId,
        salesUnitId: salesUnitId,
        totalAmount: totalAmount,
        totalDiscountPercent: totalDiscountPercent,
        totalDiscount: totalDiscount,
        vat: vat,
        grandTotal: grandTotal,
        warehouse: warehouse,
        requestShipDate: requestShipDate,
        shipToName: shipToName,
        shipToAddress: shipToAddress,
        shipToZipCode: shipToZipCode,
        destinationCode: destinationCode,
        routeG: routeG,
        paymentTermId: paymentTermId,
        paymentMode: paymentMode,
        memo1: memo1,
        memo2: memo2,
        memo3: memo3,
        memo4: memo4,
        status: status,
        sendFax: sendFax,
        sendEmail: sendEmail,
        deleted: deleted,
        confirmedAt: confirmedAt,
        expiredAt: expiredAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
