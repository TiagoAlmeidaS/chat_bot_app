import 'package:chat_bot_app/shared/service/web_socket/service/message_service.dart';
import 'package:mobx/mobx.dart';

import 'config/user_config.dart';
import 'model/message_model.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {

  final MessageService messageService; //Inicializar no controllador;
  _ChatControllerBase(this.messageService) {
    init();
  }

  @observable
  ObservableList<MessageModel> messages = ObservableList<MessageModel>();

  @action
  void sendMessage(String text) {
    final message = MessageModel(
      user: UserConfig.name,
      message: text
    );
    messageService.sendMessage(message);
  }

  void init() {
    messageService.initConection();
    messageService.broadcastNotification(onReceive: (message) => messages.add(message));
  }

}