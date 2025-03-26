import 'dart:developer';

import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  final String text;
  final String sender;

  const ChatMessages({super.key, required this.text, required this.sender});

  @override
  Widget build(BuildContext context) {
    bool isUser = sender == 'user';
    final User? user = FirebaseAuth.instance.currentUser;

    List<Widget> messageWidgets = [];

    if (!isUser) {
      messageWidgets.add(
        Container(
          padding: const EdgeInsets.all(15.0),
          // margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: const CircleAvatar(
            child: Text('AI Buddy', style: TextStyle(fontSize: 10)),
          ),
        ),
      );
    }

    messageWidgets.add(
      Flexible(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: isUser ? Colors.blue : Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

    if (isUser) {
      messageWidgets.add(
        Container(
          padding: const EdgeInsets.all(15.0),
          // margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CircleAvatar(
            child: Text(user!.displayName ?? 'User', style: const TextStyle(fontSize: 10)),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: messageWidgets,
    );
  }
}
