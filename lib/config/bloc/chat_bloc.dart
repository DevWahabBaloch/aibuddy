import 'dart:async';

import 'package:aibuddy/config/bloc/chat_event.dart';
import 'package:aibuddy/config/bloc/chat_state.dart';
import 'package:aibuddy/features/chat_page/models/chat_model.dart';
import 'package:aibuddy/features/chat_page/repos/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }
  List<ChatModel> messages = [];
  FutureOr<void> chatGenerateNewTextMessageEvent(ChatGenerateNewTextMessageEvent event, Emitter<ChatState> emit) async {
    messages.add(ChatModel(role: 'user', parts: [ChatPartModel(text: event.inputMessage)]));
    emit(ChatSuccessState(messages: messages));
    await ChatRepo.chatTextGenerationRepo(messages);
  }
}
