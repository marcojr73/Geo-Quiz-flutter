import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/authApi.dart';
import 'package:geo_quiz_mobile/components/signInUp/Header.dart';
import 'package:geo_quiz_mobile/components/signInUp/InputForm.dart';
import 'package:geo_quiz_mobile/utils/AppRouters.dart';
import 'package:geo_quiz_mobile/utils/showError.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  final formData = <String, String>{};

  bool isLoading = false;

  void submit(context) async {
    formKey.currentState?.save();

    setState(() {
      isLoading = true;
    });
    final response = await signUpApi(
      formData["name"], 
      formData["email"], 
      formData["password"], 
      formData["confirmPassword"]
    );
    setState(() {
      isLoading = false;
    });
    if(response != 201) showError(context, "you did not fill in all the fields correctly");
    if(response == 201) showError(context, "Created");
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
                    isLoading ?
                    const CircularProgressIndicator()
                    :
                    SizedBox(
                      width: 310,
                      child: ElevatedButton(
                        onPressed: () => submit(context),
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
