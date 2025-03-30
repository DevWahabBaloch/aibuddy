import 'dart:developer';

import 'package:aibuddy/features/chat_page/controller/saved_chats_controller.dart';
import 'package:aibuddy/features/chat_page/view/chat_page.dart';
import 'package:aibuddy/features/chat_page/widgets/recent_saved_chat_tile.dart';
import 'package:aibuddy/gen/assets.gen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Future<List<Map<String, String>>> _fetchSavedChats() async {
    final databaseReferenceToStoreChats = FirebaseDatabase.instance.ref('saved_chats');
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user == null) return [];

    final snapshot = await databaseReferenceToStoreChats.child(user.uid).get();
    if (snapshot.exists && snapshot.value is Map) {
      Map<dynamic, dynamic> chats = snapshot.value as Map<dynamic, dynamic>;
      List<Map<String, String>> chatList = [];
      chats.forEach((chatId, messages) {
        if (messages is Map) {
          messages.forEach((messageId, messageData) {
            if (messageData['role'] == 'user') {
              chatList.add({
                'chatId': chatId.toString(),
                'text': messageData['text'].toString(),
              });
              return;
            }
          });
        }
      });
      chatList.sort((a, b) => b['chatId']!.compareTo(a['chatId']!));
      log('[log] Saved Chats: $chatList');
      return chatList;
    }
    return [];
  }

  Future<void> _deleteChat(String chatId) async {
    final databaseReferenceToStoreChats = FirebaseDatabase.instance.ref('saved_chats');
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      await databaseReferenceToStoreChats.child(user.uid).child(chatId).remove();
      log('[log] Deleted chatId: $chatId');
    } else {
      log('[log] User not authenticated, cannot delete chat');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    Get.put(SavedChatsController());

    return Container(
      height: height,
      width: width * 0.8,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.1, left: width * 0.02, right: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white),
                fillColor: const Color.fromARGB(45, 158, 158, 158),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                prefixIcon: SvgPicture.asset(
                  Assets.svgs.searchIcon,
                  color: Colors.white,
                  height: 20,
                  width: 20,
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 40,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, String>>>(
                future: _fetchSavedChats(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        "No saved chats",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  final savedChats = snapshot.data!;
                  return ListView.builder(
                    itemCount: savedChats.length,
                    itemBuilder: (context, index) {
                      final chat = savedChats[index];
                      return Dismissible(
                        key: Key(chat['chatId']!),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) async {
                          await _deleteChat(chat['chatId']!);
                          Get.snackbar(
                            "Chat Deleted",
                            "Deleted chat: ${chat['text']}",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            duration: const Duration(seconds: 2),
                          );
                        },
                        child: RecentSavedChatTile(
                          title: chat['text']!,
                          onTap: () {
                            log("[log] Chat data: $chat");
                            if (chat.containsKey('chatId') && chat['chatId'] != null) {
                              final chatId = chat['chatId'].toString();
                              log("[log] Navigating with chatId: $chatId");
                              Get.to(() => const ChatPage(), arguments: {'chatId': chatId});
                            } else {
                              log("[log] Error: chatId is missing or null!");
                            }
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
