import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/core/widgets/appbar/appbar/my_app_bar.dart';
import 'package:aibuddy/features/chat_page/widgets/chat_messages.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart' as gpt;
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
  void _sendMessages() {
    ChatMessages messages = ChatMessages(text: _textController.text, sender: 'AI Buddy');
    setState(() {
      _messages.insert(0, messages);
    });

    _textController.clear();
  }

  // Instance Of OpenAI
  final _openAI = gpt.OpenAI.instance.build(
      token: dotenv.env['CHATGPT_API_KEY'],
      baseOption: gpt.HttpSetup(
        receiveTimeout: const Duration(seconds: 8),
      ),
      enableLog: true);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    Widget buildTextComposer() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
                decoration: const InputDecoration.collapsed(hintText: 'Send a message'),
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
            height: height * 0.07,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
            child: buildTextComposer(),
          )
        ],
      ),
    );
  }
}
