import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/components/quiz/OptionButton.dart';

class Question extends StatelessWidget {
  final String name;
  final List options;
  final String title;
  const Question(
      {super.key,
      required this.name,
      required this.options,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        color: Theme.of(context).colorScheme.secondary,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text("What is the $title", style: const TextStyle(fontSize: 30)),
          Text(name, style: const TextStyle(fontSize: 50)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Column(
            children: [
              OptionButton(option: options[0]),
              OptionButton(option: options[1]),
              OptionButton(option: options[2]),
              OptionButton(option: options[3]),
              OptionButton(option: options[4])
            ],
          )
        ]),
      ),
    ]);
  }
}
