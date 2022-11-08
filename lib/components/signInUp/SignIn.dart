import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/authApi.dart';
import 'package:geo_quiz_mobile/components/signInUp/Header.dart';
import 'package:geo_quiz_mobile/components/signInUp/InputForm.dart';
import 'package:geo_quiz_mobile/utils/AppRouters.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();

  final formData = <String, String>{};

  bool isLoading = false;
  bool isError = false;

  void showError() {
    showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
          title: const Text("email or password is incorrect"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
         );
    },
   );
}

  void submit() async {
    setState(() {
      isLoading = true;
    });
    formKey.currentState?.save();
    final response = await signInApi(formData["email"], formData["password"]);
    setState(() {
      isLoading = false;
    });
    if(response != 200) showError();
    Navigator.of(context).pushNamed(AppRouters.home);
    print(response);
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
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Form(
                  key: formKey,
                  child: Column(children: [
                    InputForm(formData: formData, text: "Email", type: "email"),
                    InputForm(formData: formData, text: "Password", type: "password"),
                    const SizedBox(
                      height: 25,
                    ),
                    isLoading ? 
                    const CircularProgressIndicator()
                    :
                    SizedBox(
                      width: 310,
                      child: ElevatedButton(
                        onPressed: submit,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Theme.of(context).colorScheme.primary),
                        ),
                        child: const Text(
                          'Log-in',
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
