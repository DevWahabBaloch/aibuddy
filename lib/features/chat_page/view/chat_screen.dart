import 'dart:developer';

import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/core/widgets/appbar/appbar/my_app_bar.dart';
import 'package:aibuddy/core/widgets/jumping_dots/jumping_dots.dart';
import 'package:aibuddy/features/chat_page/controller/chat_controller.dart';
import 'package:aibuddy/features/chat_page/widgets/app_drawer.dart';
import 'package:aibuddy/features/chat_page/widgets/chat_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ChatController chatController = Get.put(ChatController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  bool _isTextFieldFocused = false;

  // Realtime Database Using Firebase:
  final _databaseReferenceToStoreChats = FirebaseDatabase.instance.ref('saved_chats');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void saveMessageToFirebase(String message) async {
    User? user = _auth.currentUser;

    if (user != null) {
      final messageId = DateTime.now().millisecondsSinceEpoch.toString();

      await _databaseReferenceToStoreChats.child(user.uid).child(messageId).set({
        'role': 'user',
        'text': message,
      });

      try {
        String aiResponse = await chatController.sendMessages(message);

        if (aiResponse.isNotEmpty) {
          await _databaseReferenceToStoreChats.child(user.uid).child('${messageId}_bot').set({
            'role': 'model',
            'text': aiResponse,
          });
        }
      } catch (e) {
        log("Failed to fetch AI response: $e");
      }
    } else {
      log("User not authenticated!");
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isTextFieldFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    Widget buildTextComposer() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!_isTextFieldFocused)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.star, color: AppColors.secondary),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.image_rounded, color: AppColors.secondary),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic, color: AppColors.secondary),
                  ),
                ],
              ),
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  color: const Color(0xff172032),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.04),
                    child: TextField(
                      controller: _textController,
                      focusNode: _focusNode,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      style: const TextStyle(color: Colors.white),
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                      decoration: const InputDecoration(
                          hintText: 'Ask me anything...', hintStyle: TextStyle(color: Colors.grey), border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                String message = _textController.text.trim();
                if (message.isNotEmpty) {
                  saveMessageToFirebase(message);
                  _textController.clear();
                  _focusNode.unfocus();
                }
              },
              icon: const Icon(Icons.send, color: Colors.blue),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.primary,
      appBar: MyAppBar(
        title: 'AI Buddy',
        onTap: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Obx(
              () => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final messages = chatController.messages[index];
                  return ChatMessages(text: messages.parts.first.text, sender: messages.role);
                },
              ),
            ),
          ),
          Obx(
            () => chatController.isLoading.value
                ? const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: JumpingDots(),
                  )
                : const SizedBox(),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff0a1427),
            ),
            child: buildTextComposer(),
          ),
        ],
      ),
    );
  }
}
