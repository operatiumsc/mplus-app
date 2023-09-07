import 'package:mplus_app/app/invoices/domain/entities/invoice.dart';

class InvoiceDto {
  String? id;
  String? customerId;
  String? axSalesId;
  DateTime? invoiceDate;
  DateTime? dueDate;
  DateTime? documentDate;
  int? quantity;
  double? volume;
  double? weight;
  double? salesBalance;
  double? vat;
  double? invoiceAmount;
  String? salesAdministrator;
  String? salesUnitId;
  String? salesRepId;
  String? department;
  String? deliveryName;
  String? deliveryAddress;
  String? deleveryZipCode;
  String? invoicingName;
  String? invoicingAddress;
  String? invoicingZipCode;
  String? customerRef;
  String? bpcCustomerRef;
  String? bpcMessage;
  DateTime? bpcInvoiceRecieptAt;
  DateTime? bpcInvoiceCompletedAt;
  String? bpcBillCollector;
  DateTime? createdAt;
  int? overDueDays;

  InvoiceDto({
    required this.id,
    required this.customerId,
    required this.axSalesId,
    required this.invoiceDate,
    required this.dueDate,
    required this.documentDate,
    required this.quantity,
    required this.volume,
    required this.weight,
    required this.salesBalance,
    required this.vat,
    required this.invoiceAmount,
    required this.salesAdministrator,
    required this.salesUnitId,
    required this.salesRepId,
    required this.department,
    required this.deliveryName,
    required this.deliveryAddress,
    required this.deleveryZipCode,
    required this.invoicingName,
    required this.invoicingAddress,
    required this.invoicingZipCode,
    required this.customerRef,
    required this.bpcCustomerRef,
    required this.bpcMessage,
    required this.bpcInvoiceRecieptAt,
    required this.bpcInvoiceCompletedAt,
    required this.bpcBillCollector,
    required this.createdAt,
    required this.overDueDays,
  });

  factory InvoiceDto.fromJson(Map<String?, dynamic> json) => InvoiceDto(
        id: json["id"],
        customerId: json["customerId"],
        axSalesId: json["axSalesId"],
        invoiceDate: DateTime.tryParse(json["invoiceDate"] ?? ''),
        dueDate: DateTime.tryParse(json["dueDate"] ?? ''),
        documentDate: DateTime.tryParse(json["documentDate"] ?? ''),
        quantity: json["quantity"],
        volume: json["volume"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
        salesBalance: json["salesBalance"]?.toDouble(),
        vat: json["vat"]?.toDouble(),
        invoiceAmount: json["invoiceAmount"]?.toDouble(),
        salesAdministrator: json["salesAdministrator"],
        salesUnitId: json["salesUnitId"],
        salesRepId: json["salesRepId"],
        department: json["department"],
        deliveryName: json["deliveryName"],
        deliveryAddress: json["deliveryAddress"],
        deleveryZipCode: json["deleveryZipCode"],
        invoicingName: json["invoicingName"],
        invoicingAddress: json["invoicingAddress"],
        invoicingZipCode: json["invoicingZipCode"],
        customerRef: json["customerRef"],
        bpcCustomerRef: json["bpcCustomerRef"],
        bpcMessage: json["bpcMessage"],
        bpcInvoiceRecieptAt:
            DateTime.tryParse(json["bpcInvoiceRecieptAt"] ?? ''),
        bpcInvoiceCompletedAt:
            DateTime.tryParse(json["bpcInvoiceCompletedAt"] ?? ''),
        bpcBillCollector: json["bpcBillCollector"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        overDueDays: json["overDueDays"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "customerId": customerId,
        "axSalesId": axSalesId,
        "invoiceDate": invoiceDate?.toIso8601String(),
        "dueDate": dueDate?.toIso8601String(),
        "documentDate": documentDate?.toIso8601String(),
        "quantity": quantity,
        "volume": volume,
        "weight": weight,
        "salesBalance": salesBalance,
        "vat": vat,
        "invoiceAmount": invoiceAmount,
        "salesAdministrator": salesAdministrator,
        "salesUnitId": salesUnitId,
        "salesRepId": salesRepId,
        "department": department,
        "deliveryName": deliveryName,
        "deliveryAddress": deliveryAddress,
        "deleveryZipCode": deleveryZipCode,
        "invoicingName": invoicingName,
        "invoicingAddress": invoicingAddress,
        "invoicingZipCode": invoicingZipCode,
        "customerRef": customerRef,
        "bpcCustomerRef": bpcCustomerRef,
        "bpcMessage": bpcMessage,
        "bpcInvoiceRecieptAt": bpcInvoiceRecieptAt?.toIso8601String(),
        "bpcInvoiceCompletedAt": bpcInvoiceCompletedAt?.toIso8601String(),
        "bpcBillCollector": bpcBillCollector,
        "createdAt": createdAt?.toIso8601String(),
        "overDueDays": overDueDays,
      };
}

extension InvoiceMapper on InvoiceDto {
  Invoice toEntity() => Invoice(
        id: id,
        customerId: customerId,
        axSalesId: axSalesId,
        invoiceDate: invoiceDate,
        dueDate: dueDate,
        documentDate: documentDate,
        quantity: quantity,
        volume: volume,
        weight: weight,
        salesBalance: salesBalance,
        vat: vat,
        invoiceAmount: invoiceAmount,
        salesAdministrator: salesAdministrator,
        salesUnitId: salesUnitId,
        salesRepId: salesRepId,
        department: department,
        deliveryName: deliveryName,
        deliveryAddress: deliveryAddress,
        deleveryZipCode: deleveryZipCode,
        invoicingName: invoicingName,
        invoicingAddress: invoicingAddress,
        invoicingZipCode: invoicingZipCode,
        customerRef: customerRef,
        bpcCustomerRef: bpcCustomerRef,
        bpcMessage: bpcMessage,
        bpcInvoiceRecieptAt: bpcInvoiceRecieptAt,
        bpcInvoiceCompletedAt: bpcInvoiceCompletedAt,
        bpcBillCollector: bpcBillCollector,
        createdAt: createdAt,
        overDueDays: overDueDays,
      );
}
