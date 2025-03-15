import 'package:aibuddy/features/chat_page/models/chat_model.dart';
import 'package:aibuddy/features/chat_page/widgets/chat_messages.dart';
import 'package:flutter/material.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

class ChatSuccessState extends ChatState {
  final List<ChatModel> messages;

  ChatSuccessState({required this.messages});
}
