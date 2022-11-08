import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/authApi.dart';
import 'package:geo_quiz_mobile/components/signInUp/Header.dart';
import 'package:geo_quiz_mobile/components/signInUp/InputForm.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final formKey = GlobalKey<FormState>();
  final formData = <String, String>{};

  void submit() async {
    formKey.currentState?.save();
    final response = await signUpApi(
      formData["name"], 
      formData["email"], 
      formData["password"], 
      formData["confirmPassword"]
    );
    if(response["error"] != null) {
      print("deu ruim aq");
    }
    // print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const Header(),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                  key: formKey,
                  child: Column(children: [
                    InputForm(formData: formData, text: "Name", type: "name"),
                    InputForm(formData: formData, text: "Email", type: "email"),
                    InputForm(formData: formData, text: "Password", type: "password"),
                    InputForm(formData: formData, text: "Confirm password", type: "confirmPassword"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      width: 310,
                      child: ElevatedButton(
                        onPressed: submit,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Theme.of(context).colorScheme.primary),
                        ),
                        child: const Text(
                          'Create',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
