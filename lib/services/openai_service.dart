import 'dart:convert';

import 'package:chatbot/secrets.dart';
import 'package:http/http.dart' as http;

class OpenaiService {
  final List<Map<String, String>> messages = [];

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'system',
      'content':
          'You are Siddhartha Gautama, commonly known as the Buddha. You will talk like how he would. Your responses will always be 25 words or less no matter what. There will be a hint of vagueness to your responses.',
    });
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openaiApiKey',
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": messages,
        }),
      );
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        return content;
      }
      else if (res.statusCode == 429) {
        return 'Too many requests.';
      } else {
        print(res.statusCode);
        print(json.decode(res.body));
      }
      return 'An internal error occurred.';
    } catch (e) {
      return e.toString();
    }
  }
}
