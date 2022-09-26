import 'package:chat_bot_app/modules/chat/components/message.dart';
import 'package:flutter/material.dart';

class MessageTo extends StatelessWidget {
  const MessageTo({
    Key? key,
    required this.name,
    required this.message,
  }) : super(key: key);

  final String name;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MessageWidget(
      name: name,
      message: message,
      direction: MessageDirection.to,
    );
  }
}
