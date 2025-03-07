import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  final String text;
  final String sender;
  const ChatMessages({super.key, required this.text, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            child: Text(sender[0]),
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(color: AppColors.secondary, fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(
                text,
                style: TextStyle(color: AppColors.secondary, fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ))
      ],
    );
  }
}
