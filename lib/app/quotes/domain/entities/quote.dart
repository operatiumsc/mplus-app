

import '../../data/dto/quote_dto.dart';

class Quote {
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

  Quote({
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
}

extension QuoteMapper on Quote {
  QuoteDTO toModel() => QuoteDTO(
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
