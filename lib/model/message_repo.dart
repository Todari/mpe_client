import 'message.dart';

class MessageRepo {
  static const _allMessage = <Message>[
    Message(
      sender: "1",
      receiver: "0",
      sendTime: "2304181651",
      isRead: true,
      content: "야",
    ),
    Message(
      sender: "2",
      receiver: "0",
      sendTime: "2304181541",
      isRead: true,
      content: "야",
    ),
    Message(
      sender: "3",
      receiver: "0",
      sendTime: "2304181351",
      isRead: true,
      content: "야",
    ),
    Message(
      sender: "4",
      receiver: "0",
      sendTime: "2304181131",
      isRead: true,
      content: "야",
    ),
    Message(
      sender: "5",
      receiver: "0",
      sendTime: "2304181659",
      isRead: false,
      content: "야",
    ),
  ];

  static List<Message> loadMessages() {
    return _allMessage;
  }
}
