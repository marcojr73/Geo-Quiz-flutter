import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/components/signInUp/Header.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Header(),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          color: Theme.of(context).colorScheme.secondary,
        )
      ],
    ));
  }
}
