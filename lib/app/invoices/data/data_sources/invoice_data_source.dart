import 'package:mplus_app/app/invoices/data/dto/invoice_dto.dart';
import 'package:mplus_app/app/invoices/presentation/config.dart';
import 'package:mplus_app/utils/services/rest.dart';

abstract class InvoiceDataSource {
  Future<List<InvoiceDto>> getInvoices({int? page});
}

class InvoiceDataSourceImpl implements InvoiceDataSource {
  final _client = Rest().client;

  @override
  Future<List<InvoiceDto>> getInvoices({int? page}) async {
    final response = await _client.get('/invoices', queryParameters: {
      'page': page,
      'perPage': PageConfig.pageSize,
    });
    List json = response.data;
    return json.map((e) => InvoiceDto.fromJson(e)).toList();
  }
}
