import 'package:mplus_app/app/invoices/data/data_sources/invoice_data_source.dart';
import 'package:mplus_app/app/invoices/data/dto/invoice_dto.dart';
import 'package:mplus_app/app/invoices/domain/entities/invoice.dart';
import 'package:mplus_app/app/invoices/domain/repositories/invoice_repository.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceDataSource _invoiceDataSource;

  InvoiceRepositoryImpl({required InvoiceDataSource invoiceDataSource})
      : _invoiceDataSource = invoiceDataSource;

  @override
  Future<List<Invoice>> getInvoices({int? page}) async {
    final invoices = await _invoiceDataSource.getInvoices(page: page);
    return invoices.map((e) => e.toEntity()).toList();
  }
}
