// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Message extends _Message with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Message(
    String uuid,
    String type,
    String sender,
    String text,
    DateTime sendAt, {
    String? imageUrl,
    bool isRead = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Message>({
        'isRead': false,
      });
    }
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'sender', sender);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'imageUrl', imageUrl);
    RealmObjectBase.set(this, 'isRead', isRead);
    RealmObjectBase.set(this, 'sendAt', sendAt);
  }

  Message._();

  @override
  String get uuid => RealmObjectBase.get<String>(this, 'uuid') as String;
  @override
  set uuid(String value) => throw RealmUnsupportedSetError();

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get sender => RealmObjectBase.get<String>(this, 'sender') as String;
  @override
  set sender(String value) => RealmObjectBase.set(this, 'sender', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  String? get imageUrl =>
      RealmObjectBase.get<String>(this, 'imageUrl') as String?;
  @override
  set imageUrl(String? value) => RealmObjectBase.set(this, 'imageUrl', value);

  @override
  bool get isRead => RealmObjectBase.get<bool>(this, 'isRead') as bool;
  @override
  set isRead(bool value) => RealmObjectBase.set(this, 'isRead', value);

  @override
  DateTime get sendAt =>
      RealmObjectBase.get<DateTime>(this, 'sendAt') as DateTime;
  @override
  set sendAt(DateTime value) => RealmObjectBase.set(this, 'sendAt', value);

  @override
  Stream<RealmObjectChanges<Message>> get changes =>
      RealmObjectBase.getChanges<Message>(this);

  @override
  Message freeze() => RealmObjectBase.freezeObject<Message>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Message._);
    return const SchemaObject(ObjectType.realmObject, Message, 'Message', [
      SchemaProperty('uuid', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('sender', RealmPropertyType.string),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('imageUrl', RealmPropertyType.string, optional: true),
      SchemaProperty('isRead', RealmPropertyType.bool),
      SchemaProperty('sendAt', RealmPropertyType.timestamp),
    ]);
  }
}
