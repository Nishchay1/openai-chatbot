import 'dart:convert';

import 'package:chatbot/secrets.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final List<Map<String, String>> messages = [];

  String description;

  OpenAIService({required this.description});

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'system',
      'content':
          description,
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
          'Authorization': 'Bearer $openAIApiKey',
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": messages,
          "max_completion_tokens": 100,
        }),
      );
      if (res.statusCode == 200) {
        String content =
            jsonDecode(utf8.decode(res.bodyBytes))['choices'][0]['message']['content'];
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
