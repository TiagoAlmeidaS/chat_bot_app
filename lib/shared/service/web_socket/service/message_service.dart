import 'dart:convert';

import 'package:chat_bot_app/modules/chat/model/message_model.dart';
import 'package:web_socket_channel/io.dart';

class MessageService {
  late IOWebSocketChannel channel;

  Future initConection() async {
    channel = IOWebSocketChannel.connect('ws://localhost:8080/chat',
        headers: {}, pingInterval: const Duration(seconds: 5));
  }

  void sendMessage(MessageModel chatModel) {
    channel.sink.add(jsonEncode(chatModel.toJson()));
  }

  Future _retrayConection({
    required void Function(MessageModel) onReceive,
  }) async {
    await Future.delayed(const Duration(seconds: 5));
    await initConection();
    await broadcastNotification(onReceive: onReceive);
  }

  Future broadcastNotification({
    required void Function(MessageModel) onReceive,
  }) async {
    channel.stream.listen(
      (event) {
        final Map<String, dynamic> json = jsonDecode(event);
        final message = MessageModel.fromJson(json);
        onReceive(message);
      },
      onError: (_) async {
        _retrayConection(onReceive: onReceive);
      },
      onDone: () async {
        _retrayConection(onReceive: onReceive);
      },
      cancelOnError: true,
    );
  }
}
