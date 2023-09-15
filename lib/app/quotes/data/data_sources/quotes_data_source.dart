import 'package:mplus_app/app/invoices/presentation/config.dart';

import '../../../../utils/services/rest.dart';
import '../dto/quote_dto.dart';

abstract class QuotesDataSource {
  Future<List<QuoteDTO>> getQuotes({int? page});
}

class QuotesDataSourceImpl implements QuotesDataSource {
  final _client = Rest().client;

  @override
  Future<List<QuoteDTO>> getQuotes({int? page}) async {
    final response = await _client.get('/quotations', queryParameters: {
      'page': page,
      'perPage': PageConfig.pageSize,
    });

    List json = response.data;
    return json.map((e) => QuoteDTO.fromJson(e)).toList();
  }
}
