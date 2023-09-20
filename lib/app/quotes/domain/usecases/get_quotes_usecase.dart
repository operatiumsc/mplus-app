import 'package:mplus_app/app/quotes/domain/entities/quote.dart';
import 'package:mplus_app/app/quotes/domain/repositories/quotes_repository.dart';

class GetQuotesUseCase {
  GetQuotesUseCase({required QuotesRepository quotesRepository})
      : _quotesRepository = quotesRepository;

  final QuotesRepository _quotesRepository;

  Future<List<Quote>> call({int? page}) {
    return _quotesRepository.getQuotes(page: page);
  }
}
