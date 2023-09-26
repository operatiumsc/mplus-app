import 'package:mplus_app/app/invoices/data/dto/invoice_dto.dart';
import 'package:mplus_app/utils/constants/page_config.dart';
import 'package:mplus_app/utils/services/rest.dart';

abstract class InvoiceDataSource {
  Future<List<InvoiceDTO>> getInvoices({int? page});
}

class InvoiceDataSourceImpl implements InvoiceDataSource {
  final _client = Rest().client;

  @override
  Future<List<InvoiceDTO>> getInvoices({int? page}) async {
    final response = await _client.get('/invoices', queryParameters: {
      'page': page,
      'perPage': PageConfig.defaultPageSize,
    });
    List json = response.data;
    return json.map((e) => InvoiceDTO.fromJson(e)).toList();
  }
}
