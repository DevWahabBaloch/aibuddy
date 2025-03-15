import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/core/widgets/appbar/appbar/my_app_bar.dart';
import 'package:aibuddy/features/chat_page/controller/chat_controller.dart';
import 'package:aibuddy/features/chat_page/widgets/chat_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessages> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ChatController chatController = Get.find<ChatController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    Widget buildTextComposer() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.star, color: AppColors.secondary)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.image_rounded, color: AppColors.secondary)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.mic, color: AppColors.secondary)),
            Expanded(
              child: Container(
                height: height * 0.055,
                width: width * 0.1,
                decoration: BoxDecoration(color: const Color(0xff172032), borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.04),
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(color: Colors.white),
                      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Ask me anything...', hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (_textController.text.isNotEmpty) {
                    chatController.sendMessages(_textController.text);
                    _textController.clear();
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.blue,
                ))
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: MyAppBar(
        title: 'AI Buddy',
      ),
      body: Column(
        children: [
          Flexible(
              child: Obx(
            () => ListView.builder(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemCount: chatController.messages.length,
              itemBuilder: (context, index) {
                final messages = chatController.messages[index];
                return ChatMessages(text: messages.parts[0].text, sender: messages.role == 'user' ? 'You' : 'AI Buddy');
              },
            ),
          )),
          Obx(
            () => chatController.isLoading.value
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(),
          ),
          Container(
            height: height * 0.08,
            decoration: const BoxDecoration(
              color: Color(0xff0a1427),
            ),
            child: buildTextComposer(),
          )
        ],
      ),
    );
  }
}
