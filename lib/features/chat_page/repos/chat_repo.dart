import 'dart:developer';

import 'package:aibuddy/core/constants/api_constants.dart';
import 'package:aibuddy/features/chat_page/models/chat_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatRepo {
  static chatTextGenerationRepo(List<ChatModel> previousMessages) async {
    try {
      Dio dio = Dio();

      final response = dio.post(ApiConstants.BASE_URL + dotenv.env['GEMINI_API_KEY']!, data: {
        "contents": previousMessages.map((e) => e.toMap()).toList(),
        "generationConfig": {
          "temperature": 2,
          "topK": 40,
          "topP": 0.95,
          "maxOutputTokens": 8192,
          "responseMimeType": "text/plain"
        }
      });
      log('Response: $response');
    } catch (e) {
      log(e.toString());
    }
  }
}
