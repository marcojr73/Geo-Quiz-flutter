import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  var formData = <String, String>{};
  final String type; 
  final String text; 

  InputForm({required this.formData, super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
      child: TextFormField(
        decoration: InputDecoration(labelText: text),
        textInputAction: TextInputAction.next,
        obscureText: type == "password" ? true : type == "confirmPassword" ? true : false,
        onSaved: (e) => formData[type] = e ?? "",
      ),
    );
  }
}
