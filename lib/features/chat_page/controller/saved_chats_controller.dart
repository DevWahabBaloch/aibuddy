import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class SavedChatsController extends GetxController {
  final _databaseReferenceToStoreChats = FirebaseDatabase.instance.ref('saved_chats');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var savedChats = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs; // Add loading state

  @override
  void onInit() {
    super.onInit();
    // Wait for authentication state to resolve
    _auth.authStateChanges().firstWhere((user) => user != null).then((user) {
      fetchUserMessages();
    }).catchError((e) {
      log("Error waiting for auth state: $e");
      isLoading.value = false;
    });
  }

  Future<void> fetchUserMessages() async {
    isLoading.value = true;
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        DatabaseEvent event = await _databaseReferenceToStoreChats.child(user.uid).once();
        if (event.snapshot.value != null) {
          log("Raw Firebase data: ${event.snapshot.value}");
          Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;
          Map<String, Map<String, dynamic>> chatMap = {};

          data.forEach((chatId, messages) {
            if (messages is Map) {
              String latestText = '';
              int latestTimestamp = 0;
              messages.forEach((msgId, msgData) {
                if (msgData is Map && msgData['role'] == 'user') {
                  int timestamp = int.tryParse(msgId.split('_')[0]) ?? 0;
                  if (timestamp > latestTimestamp) {
                    latestTimestamp = timestamp;
                    latestText = msgData['text'] ?? '';
                  }
                }
              });
              if (latestText.isNotEmpty) {
                chatMap[chatId.toString()] = {
                  'chatId': chatId.toString(),
                  'text': latestText,
                };
              }
            }
          });

          List<Map<String, dynamic>> chatList = chatMap.values.toList();
          chatList.sort((a, b) => b['chatId'].compareTo(a['chatId']));
          savedChats.assignAll(chatList);
          log("Processed chat list: $chatList");
        } else {
          log("No saved chats found for user ${user.uid}");
        }
      } catch (e) {
        log("Error fetching saved chats: $e");
      } finally {
        isLoading.value = false;
      }
    } else {
      log("User not authenticated");
      isLoading.value = false;
    }
  }
}
