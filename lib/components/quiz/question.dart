import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/components/quiz/OptionButton.dart';
import 'package:geo_quiz_mobile/components/quiz/ScoreBoard.dart';

class Question extends StatefulWidget {
  final String name;
  final List options;
  final String type;
  final int quizId;
  final List scoreBoard;
  final void Function() setIndex;
  final void Function(dynamic) setScoreBoard;

  const Question(
      {super.key,
      required this.name,
      required this.options,
      required this.type,
      required this.setIndex,
      required this.quizId, 
      required this.setScoreBoard, 
      required this.scoreBoard});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(children: [
          widget.type == "territories" ? const SizedBox()
          :
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          widget.type == "flags" ?
          Text(widget.name, style: const TextStyle(fontSize: 78))
          :
          widget.type == "capitals" ?
          Text(widget.name, style: const TextStyle(fontSize: 50))
          :
          Image.network(widget.name, width: 300,),
          widget.type == "territories" ? const SizedBox()
          :
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Column(
            children: [
              OptionButton(
                  option: widget.options[0],
                  setIndex: widget.setIndex,
                  type: widget.type,
                  setScoreBoard: widget.setScoreBoard,
                  quizId: widget.quizId),
              OptionButton(
                  option: widget.options[1],
                  setIndex: widget.setIndex,
                  type: widget.type,
                  setScoreBoard: widget.setScoreBoard,
                  quizId: widget.quizId),
              OptionButton(
                  option: widget.options[2],
                  setIndex: widget.setIndex,
                  type: widget.type,
                  setScoreBoard: widget.setScoreBoard,
                  quizId: widget.quizId),
              OptionButton(
                  option: widget.options[3],
                  setIndex: widget.setIndex,
                  type: widget.type,
                  setScoreBoard: widget.setScoreBoard,
                  quizId: widget.quizId),
              OptionButton(
                  option: widget.options[4],
                  setIndex: widget.setIndex,
                  type: widget.type,
                  setScoreBoard: widget.setScoreBoard,
                  quizId: widget.quizId)
            ],
          ),
          ScoreBoard(scoreBoard: widget.scoreBoard)
        ]),
      ),
    );
  }
}
