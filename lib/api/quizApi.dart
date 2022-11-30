import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future <List<dynamic>> getQuizApi(String type, String level) async {
  const baseUrl = "https://geo-quiz-api.herokuapp.com";
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  try {
    final response = await http.get(Uri.parse("$baseUrl/$type/$level"),
            headers: {"Content-type": "application/json",
                      "Authorization": "Bearer $token"
            },
          );
    print(response);
    if(response.statusCode != 200){
      throw Exception({"error": response.statusCode});
    } else {
      List<dynamic> map = jsonDecode(response.body);
      return map;
    }
  } catch (e) {
    throw(e);
    print(e);
  }
}

Future validateQuestionApi(String type, String answer, int quizId) async {
  const baseUrl = "https://geo-quiz-api.herokuapp.com";
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  try {
    final response = await http.post(Uri.parse("$baseUrl/validate/$type"),
            body: jsonEncode({
              "quizId": quizId,
              "answer": answer,
            }),
            headers: {"Content-type": "application/json",
                      "Authorization": "Bearer $token"
            },
          );
    if(response.statusCode != 200){
      throw Exception({"error": response.statusCode});
    } else {
      var ans = jsonDecode(response.body);
      return ans;
    }
  } catch (e) {
    throw(e);
  }
}