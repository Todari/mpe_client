import 'package:flutter/foundation.dart' as foundation;
import 'message.dart';

class AppStateModel extends foundation.ChangeNotifier {
  late List<Message> _messages;

  final _receivedMessages = <String, String>{};

  Map<String, String> get receivedMessages {
    return Map.from(_receivedMessages);
  }

  List<Message> getMessages() {
    return List.from(_messages);
  }

  List<Message> search(String serachTerms) {
    return getMessages().where((m) {
      return m.sender.toLowerCase().contains(serachTerms.toLowerCase());
    }).toList();
  }
}
