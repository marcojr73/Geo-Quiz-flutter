import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/quizApi.dart';
import 'package:geo_quiz_mobile/components/quiz/Questions.dart';
import 'package:geo_quiz_mobile/components/quiz/question.dart';
import 'package:geo_quiz_mobile/utils/showError.dart';

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
    var quiz = getQuiz();
    return Scaffold(
        appBar: AppBar(
          title: widget.type == "territories"
              ? const Text("What is the territory ?")
              : Text(
                  "what is the ${widget.type.substring(0, widget.type.length - 1)} ?"),
        ),
        body: Center(
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: FutureBuilder(
                future: getQuiz(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator()
                    ); 
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: CircularProgressIndicator()
                    ); 
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    final e = snapshot.data;
                    return Questions(type: widget.type, quiz: e);
                  }
                  return Container();
                })),
          ),
        ));
  }
}
