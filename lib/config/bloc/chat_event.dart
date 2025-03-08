import 'package:flutter/material.dart';

@immutable
sealed class ChatEvent {}

class ChatGenerateNewTextMessageEvent extends ChatEvent {
  final String inputMessage;
}
