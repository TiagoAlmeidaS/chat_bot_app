import 'package:chat_bot_app/modules/chat/chat_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: ChatModule())
  ];
}