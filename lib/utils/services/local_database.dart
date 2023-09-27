import 'package:realm/realm.dart';

import '../../app/messages/data/dto/message.dart';

class LocalDB {
  static final config = Configuration.local([Message.schema]);
  static final instance = Realm(config);
}
