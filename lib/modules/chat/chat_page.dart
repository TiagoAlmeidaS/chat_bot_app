import 'package:chat_bot_app/modules/chat/chat_controller.dart';
import 'package:chat_bot_app/modules/chat/components/input_message.dart';
import 'package:chat_bot_app/modules/chat/components/list_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Chat-SOCKET"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListMessageView(
              messages: controller.messages,
            ),
          ),
          InputMessage(
            onSendMessage: controller.sendMessage,
          ),
        ],
      ),
    );
  }
}

