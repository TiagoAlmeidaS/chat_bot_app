import 'package:chat_bot_app/modules/chat/config/user_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../model/message_model.dart';
import 'message_from.dart';
import 'message_to.dart';

class ListMessageView extends StatelessWidget {
  const ListMessageView({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<MessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];

            if (message.user == UserConfig.name) {
              return MessageFrom(
                name: message.user ?? "",
                message: message.message ?? "",
              );
            }
            return MessageTo(
              name: message.user ?? "",
              message: message.message ?? "",
            );
          },
        );
      },
    );
  }
}
