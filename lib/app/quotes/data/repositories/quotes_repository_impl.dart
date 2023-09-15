import 'package:mplus_app/app/quotes/data/data_sources/quotes_data_source.dart';
import 'package:mplus_app/app/quotes/data/dto/quote_dto.dart';
import 'package:mplus_app/app/quotes/domain/entities/quote.dart';
import 'package:mplus_app/app/quotes/domain/repositories/quotes_repository.dart';

class QuotesRepositoryImpl implements QuotesRepository {
  QuotesRepositoryImpl({required QuotesDataSource quotesDataSource})
      : _quotesDataSource = quotesDataSource;

  final QuotesDataSource _quotesDataSource;

  @override
  Future<List<Quote>> getQuotes({int? page}) async {
    final data = await _quotesDataSource.getQuotes();
    return data.map((e) => e.toEntity()).toList();
  }
}
