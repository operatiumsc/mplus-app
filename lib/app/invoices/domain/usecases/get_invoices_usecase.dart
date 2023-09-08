import 'package:mplus_app/app/invoices/domain/entities/invoice.dart';
import 'package:mplus_app/app/invoices/domain/repositories/invoice_repository.dart';

class GetInvoicesUseCase {
  final InvoiceRepository _invoiceRepository;

  GetInvoicesUseCase({
    required InvoiceRepository invoiceRepository,
  }) : _invoiceRepository = invoiceRepository;

  Future<List<Invoice>> call({int? page}) {
    return _invoiceRepository.getInvoices(page: page);
  }
}
