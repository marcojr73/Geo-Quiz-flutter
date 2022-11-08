import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future signUpApi(name, email, password, confirmPassword) async {
  const baseUrl = "https://geo-quiz-api.herokuapp.com";
  final response = await http.post(Uri.parse("$baseUrl/sign-up"),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword
      }));
  final body = jsonDecode(response.body);
  return body;
}

Future signInApi(email, password) async {
  const baseUrl = "https://geo-quiz-api.herokuapp.com";
  var status;
  var token;
  var error;
  try {
    final response = await http.post(Uri.parse("$baseUrl/sign-in"),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    if(response.statusCode != 200){
      throw Exception({"error": response.statusCode});
    } else {
      return response.statusCode;
    }
  } catch (e) {
    return(e);
  }
}
