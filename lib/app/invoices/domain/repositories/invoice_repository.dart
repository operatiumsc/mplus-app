import 'package:mplus_app/app/invoices/domain/entities/invoice.dart';

abstract class InvoiceRepository {
  Future<List<Invoice>> getInvoices({int? page});
}
