import 'package:flutter_test/flutter_test.dart';
import 'package:mplus_app/app/messages/data/dto/message.dart';
import 'package:realm/realm.dart';

void main() {
  group('Realm Message Test', () {
    late Realm realm;

    setUpAll(() {
      realm = Realm(Configuration.inMemory([Message.schema]));
    });

    test('should save message.', () {
      final message = Message(
        'msgtest',
        'incoming',
        'dev',
        'This is a realm test,',
        DateTime.now(),
      );
      final response = realm.write(() => realm.add(message));

      expect(response, isA<Message>());
    });

    test('should recieve all messages.', () {
      final response = realm.all<Message>().toList();
      expect(response, isA<List<Message>>());
    });

    test('should retrieve a correct PK.', () {
      final response = realm.find<Message>('msgtest');
      expect(response?.uuid, 'msgtest');
    });

    test('should query the correct messages.', () {
      final response = realm.query<Message>("sender == 'dev'");
      expect(response.first.sender, 'dev');
    });

    test('should update the message.', () {
      final message = realm.find<Message>('msgtest');
      realm.write(() {
        message?.type = 'outgoing';
      });

      final updatedMessage = realm.find<Message>('msgtest');
      expect(updatedMessage?.type, 'outgoing');
    });

    tearDownAll(() {
      realm.close();
    });
  });
}
