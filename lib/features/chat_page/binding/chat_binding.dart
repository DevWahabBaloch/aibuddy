import 'package:aibuddy/features/chat_page/controller/chat_controller.dart';
import 'package:aibuddy/features/chat_page/controller/saved_chats_controller.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<SavedChatsController>(() => SavedChatsController());
  }
}
