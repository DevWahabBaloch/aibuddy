import 'package:aibuddy/features/chat_page/models/chat_model.dart';
import 'package:aibuddy/features/chat_page/repos/chat_repo.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {}

RxList<ChatModel> messages = <ChatModel>[].obs;

RxBool isLoading = false.obs;

Future<void> sendMessages(String inputMessage) async {
  messages.add(ChatModel(role: 'user', parts: [ChatPartModel(text: inputMessage)]));
  isLoading.value = true;

  try {
    String response = await ChatRepo.chatTextGenerationRepo(messages);

    messages.add(ChatModel(role: 'AI Buddy', parts: [ChatPartModel(text: response)]));
  } catch (e) {
    Get.snackbar('Error', 'Failed to get response: $e');
  } finally {
    isLoading.value = false;
  }
}
