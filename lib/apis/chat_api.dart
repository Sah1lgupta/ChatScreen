import 'dart:convert';

import '../datamodels/chat_model.dart';
import 'package:http/http.dart' as http;

class ChatApiService {

  static  String endPoint= "https://slaychatgpt.com/api.php";

 static Future<List<ChatMessage>> fetchData() async {
    final response = await http.get(Uri.parse('https://slaychatgpt.com/api.php'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['chatList'];
      return responseData.map((json) => ChatMessage.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

}





