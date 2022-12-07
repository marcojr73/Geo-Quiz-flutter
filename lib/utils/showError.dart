import 'package:flutter/material.dart';

void showError(context, String message) {
    showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
          title: Text(message),
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