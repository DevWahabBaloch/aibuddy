import 'dart:async';
import 'dart:developer';

import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/core/widgets/appbar/appbar/my_app_bar.dart';
import 'package:aibuddy/features/chat_page/widgets/chat_messages.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessages> _messages = [];
  final TextEditingController _textController = TextEditingController();

  late OpenAI? chatGPT;
  bool _isTyping = false;
  bool _isImageSearch = false;

  Future<void> _sendMessages() async {
    if (_textController.text.isEmpty) return;
    ChatMessages messages = ChatMessages(text: _textController.text, sender: 'User');
    setState(() {
      _messages.insert(0, messages);
      _isTyping = true;
    });

    _textController.clear();

    final request = CompleteText(prompt: messages.text, model: Gpt3TurboInstruct(), maxTokens: 200);
    final response = await chatGPT!.onCompletion(request: request);
    log(response!.choices[0].text);
    insertNewData(response.choices[0].text);
  }

  void insertNewData(String response) {
    ChatMessages buddyMessages = ChatMessages(text: response, sender: 'AI Buddy');
    setState(() {
      _isTyping = false;
      _messages.insert(0, buddyMessages);
    });
  }

  @override
  void initState() {
    super.initState();
    chatGPT = OpenAI.instance.build(
        token: dotenv.env['CHATGPT_API_KEY'],
        baseOption: HttpSetup(
          receiveTimeout: const Duration(seconds: 8),
        ),
        enableLog: true);
  }

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
                      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Ask me anything...', hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () => _sendMessages(),
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
              child: ListView.builder(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _messages[index];
            },
          )),
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
