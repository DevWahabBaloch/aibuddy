import 'package:aibuddy/core/widgets/appbar/appbar/my_app_bar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.lerp(Colors.black, Colors.white, 0.1),
      appBar: MyAppBar(title: 'AI Buddy'),
      body: const Column(),
    );
  }
}
