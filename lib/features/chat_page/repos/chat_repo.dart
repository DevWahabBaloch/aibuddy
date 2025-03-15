import 'dart:developer';
import 'package:aibuddy/core/constants/api_constants.dart';
import 'package:aibuddy/features/chat_page/models/chat_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatRepo {
  static Future<String> chatTextGenerationRepo(List<ChatModel> previousMessages) async {
    try {
      Dio dio = Dio();

      final requestData = {
        "contents": previousMessages.map((e) => e.toMap()).toList(),
        "generationConfig": {
          "temperature": 2,
          "topK": 40,
          "topP": 0.95,
          "maxOutputTokens": 8192,
          "responseMimeType": "text/plain"
        }
      };
      log('Request: ${requestData.toString()}');

      final response = await dio.post(
        ApiConstants.BASE_URL + dotenv.env['GEMINI_API_KEY']!,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: requestData,
      );

      String aiResponse = response.data['candidates'][0]['content']['parts'][0]['text'];
      log('Response: $aiResponse');
      return aiResponse;
    } on DioException catch (e) {
      log('Error: ${e.response?.data}');
      throw Exception('Failed to generate response: ${e.message}');
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('Failed to generate response: $e');
    }
  }
}
