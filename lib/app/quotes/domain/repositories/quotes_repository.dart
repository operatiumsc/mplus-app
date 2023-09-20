import 'package:mplus_app/app/quotes/domain/entities/quote.dart';

abstract class QuotesRepository {
  Future<List<Quote>> getQuotes({int? page});
}
