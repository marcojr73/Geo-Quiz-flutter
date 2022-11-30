import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/quizApi.dart';

class OptionButton extends StatelessWidget {
  final String option;
  final String type;
  final int quizId;
  final void Function() setIndex;
  final dynamic Function(dynamic) setScoreBoard;

  const OptionButton(
      {super.key,
      required this.option,
      required this.setIndex,
      required this.type,
      required this.quizId,
      required this.setScoreBoard});

  validateQuestion(type, answer, quizId) async {
    var response = await validateQuestionApi(type, answer, quizId);
    if (response == true) {
      setScoreBoard(true);
    } else {
      setScoreBoard(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.width * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            validateQuestion(type, option, quizId);
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          ),
          child: Text(
            option,
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
