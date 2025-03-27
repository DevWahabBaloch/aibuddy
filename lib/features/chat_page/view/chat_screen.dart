import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/core/widgets/appbar/appbar/my_app_bar.dart';
import 'package:aibuddy/core/widgets/jumping_dots/jumping_dots.dart';
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
  final TextEditingController _textController = TextEditingController();
  final ChatController chatController = Get.put(ChatController());
  final FocusNode _focusNode = FocusNode();
  bool _isTextFieldFocused = false;

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
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                height: height * 0.055,
                // width: _isTextFieldFocused ? width * 0.81 : width * 0.47,
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
                      maxLines: null,
                      minLines: 1,
                      style: const TextStyle(color: Colors.white),
                      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Ask me anything...',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
      backgroundColor: AppColors.primary,
      appBar: MyAppBar(
        title: 'AI Buddy',
      ),
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
            height: height * 0.08,
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
