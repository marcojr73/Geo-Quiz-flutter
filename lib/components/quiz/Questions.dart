import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/components/quiz/FinalScore.dart';
import 'package:geo_quiz_mobile/components/quiz/question.dart';

class Questions extends StatefulWidget {
  final String type;
  final List<dynamic>? quiz;
  const Questions({super.key, required this.type, required this.quiz});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int index = 0;
  final List scoreBoard = [];

  void setIndex() {
    setState(() {
      index++;
    });
  }

  setScoreBoard(answer) {
    if (answer) {
      setState(() {
        scoreBoard.add(true);
      });
    } else {
      setState(() {
        scoreBoard.add(false);
      });
    }
    setIndex();
  }

  @override
  Widget build(BuildContext context) {
    return index == 10
        ? FinalScore(
            scoreBoard: scoreBoard,
          )
        : Question(
            setIndex: setIndex,
            title: widget.type,
            name: widget.quiz![index]["name"],
            options: widget.quiz![index]["options"],
            quizId: widget.quiz![index]["id"],
            scoreBoard: scoreBoard,
            setScoreBoard: setScoreBoard,
          );
  }
}
