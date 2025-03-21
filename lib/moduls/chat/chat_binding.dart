import 'package:get/get_instance/get_instance.dart';
import 'package:get/utils.dart';
import 'package:perplexilty_clone/moduls/chat/controller/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
