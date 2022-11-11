import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/components/home/Ranking.dart';
import 'package:geo_quiz_mobile/models/RankingModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Future <Map<String, dynamic>> getRankingApi() async {
  const baseUrl = "https://geo-quiz-api.herokuapp.com";
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString("token");
  try {
    final response = await http.get(Uri.parse("$baseUrl/users/ranking"),
            headers: {"Content-type": "application/json",
                      "Authorization": "$token"
            },
          );
    if(response.statusCode != 200){
      throw Exception({"error": response.statusCode});
    } else {
      Map<String, dynamic> map = jsonDecode(response.body);
      List<dynamic> list = map["weekScore"];
      return map;
    }
  } catch (e) {
    throw(e);
    print(e);
  }
}