import 'package:flutter_test/flutter_test.dart';
import 'package:mplus_app/app/quotes/data/data_sources/quotes_data_source.dart';
import 'package:mplus_app/app/quotes/data/repositories/quotes_repository_impl.dart';
import 'package:mplus_app/app/quotes/domain/entities/quote.dart';
import 'package:mplus_app/app/quotes/domain/repositories/quotes_repository.dart';

void main() {
  group('Quotes Repository Test', () {
    late final QuotesRepository quotesRepository;

    setUp(() {
      quotesRepository =
          QuotesRepositoryImpl(quotesDataSource: QuotesDataSourceImpl());
    });

    test('Should recieved list of quotes', () async {
      final quotes = await quotesRepository.getQuotes();

      expect(quotes, isA<List<Quote>>);
    });
  });
}
