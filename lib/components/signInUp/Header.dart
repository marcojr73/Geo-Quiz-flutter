import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          color: Theme.of(context).colorScheme.primary,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png",
                  width: MediaQuery.of(context).size.height * 0.2),
              const Text(
                "GeoQuiz",
                style: TextStyle(
                  fontSize: 34
                ),
              )
            ],
          )),
        );
  }
}