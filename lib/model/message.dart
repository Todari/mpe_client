import 'package:flutter/foundation.dart';

class Message {
  const Message({
    required this.sender,
    required this.receiver,
    required this.sendTime,
    required this.isRead,
    required this.content,
  })  : assert(sender != null, 'sender must not be null'),
        assert(receiver != null, 'receiver must not be null'),
        assert(sendTime != null, 'sendTime must not be null'),
        assert(isRead != null, 'isRead must not be null'),
        assert(content != null, 'content must not be null');

  final String sender;
  final String receiver;
  final String sendTime;
  final bool isRead;
  final String content;
}
