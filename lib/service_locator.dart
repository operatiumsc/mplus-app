import 'package:get_it/get_it.dart';
import 'package:mplus_app/data/data_sources/local/cached_service.dart';

final services = GetIt.instance;

void setUpLocator() {
  services.registerSingletonAsync(() => SharedPrefs().init());
}
