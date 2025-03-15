import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  final String text;
  final String sender;

  const ChatMessages({super.key, required this.text, required this.sender});

  @override
  Widget build(BuildContext context) {
    bool isUser = sender == 'user'; // Check if sender is 'user'

    // Build the list of widgets
    List<Widget> messageWidgets = [];

    // Model message: avatar on the left
    if (!isUser) {
      messageWidgets.add(
        Container(
          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: const CircleAvatar(
            child: Text('M'), // 'M' for model
          ),
        ),
      );
    }

    // Add the message card
    messageWidgets.add(
      Flexible(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: isUser ? Colors.blue : Colors.grey, // Blue for user, grey for model
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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

    // User message: avatar on the right
    if (isUser) {
      messageWidgets.add(
        Container(
          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: const CircleAvatar(
            child: Text('U'), // 'U' for user
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
