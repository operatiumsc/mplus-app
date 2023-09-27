import "package:realm/realm.dart";

part 'message.g.dart';

@RealmModel()
class _Message {
  @PrimaryKey()
  late final String uuid;

  late String type;
  late String sender;
  late String text;
  String? imageUrl;
  bool isRead = false;

  late DateTime sendAt;
}
