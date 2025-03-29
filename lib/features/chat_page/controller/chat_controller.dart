import 'dart:developer';
import 'package:aibuddy/features/chat_page/models/chat_model.dart';
import 'package:aibuddy/features/chat_page/repos/chat_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<ChatModel> messages = <ChatModel>[].obs;
  RxBool isLoading = false.obs;

  Future<String> sendMessages(String inputMessage) async {
    messages.add(ChatModel(role: 'user', parts: [ChatPartModel(text: inputMessage)]));
    isLoading.value = true;
    try {
      String response = await ChatRepo.chatTextGenerationRepo(messages);
      messages.add(ChatModel(role: 'model', parts: [ChatPartModel(text: response)]));
      return response;
    } catch (e) {
      Get.snackbar('Error', 'Failed to get response: $e');
      return "Error generating response";
    } finally {
      isLoading.value = false;
    }
  }

  void loadChatHistory(String chatId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final chatRef = FirebaseDatabase.instance.ref('saved_chats').child(user.uid).child(chatId);
    try {
      final snapshot = await chatRef.get();
      log("Snapshot value for chatId $chatId: ${snapshot.value}");
      messages.clear();

      if (snapshot.exists && snapshot.value is Map) {
        Map<dynamic, dynamic> chatData = snapshot.value as Map<dynamic, dynamic>;
        List<MapEntry<dynamic, dynamic>> sortedMessages = chatData.entries.toList();
        sortedMessages.sort((a, b) => a.key.toString().compareTo(b.key.toString()));

        for (var entry in sortedMessages) {
          var msgData = entry.value;
          if (msgData is Map) {
            messages.add(ChatModel(
              role: msgData['role'] ?? 'user',
              parts: [ChatPartModel(text: msgData['text'] ?? '')],
            ));
          }
        }
      }
      log("Loaded ${messages.length} messages for chatId: $chatId");
    } catch (e) {
      log("Error loading chat history: $e");
    }
  }
}
