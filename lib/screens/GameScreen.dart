import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/quizApi.dart';
import 'package:geo_quiz_mobile/components/quiz/question.dart';

class GameScreen extends StatefulWidget {
  final String type;
  final String level;

  const GameScreen({super.key, required this.type, required this.level});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  int index = 0;

  void setIndex(){
    setState(() {
      index++;
    });
  }

  Future<List<dynamic>> getQuiz() async {
      final List<dynamic> data = await getQuizApi(widget.type, widget.level);
      print(data);
      return data;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.type}, ${widget.level}"),
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
                  return Question(title: widget.type.substring(0, widget.type.length - 1), name: e![index]["name"], options: e[index]["options"],);
                }
                return const Text("lets go my little children");
            })),
        ));
  }
}
