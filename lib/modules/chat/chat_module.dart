
import 'package:chat_bot_app/modules/chat/chat_controller.dart';
import 'package:chat_bot_app/modules/chat/chat_page.dart';
import 'package:chat_bot_app/shared/service/web_socket/service/message_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind((i) => ChatController(i.get())),
    Bind((i) => MessageService())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => ChatPage(),
    ),
  ];

}