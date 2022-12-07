import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/quizApi.dart';
import 'package:geo_quiz_mobile/components/quiz/Questions.dart';
import 'package:geo_quiz_mobile/components/quiz/question.dart';

class GameScreen extends StatefulWidget {
  final String type;
  final String level;

  const GameScreen({super.key, required this.type, required this.level});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  Future<List<dynamic>> getQuiz() async {
    final List<dynamic> data = await getQuizApi(widget.type, widget.level);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("what is the ${widget.type.substring(0, widget.type.length - 1)}"),
        ),
        body: Center(
          child: FutureBuilder(
              future: getQuiz(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return const CircularProgressIndicator();
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  final e = snapshot.data;
                  return Questions(type: widget.type, quiz: e);
                }
                return Container();
              })),
        ));
  }
}
