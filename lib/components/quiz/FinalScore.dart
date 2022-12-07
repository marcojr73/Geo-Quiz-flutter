import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_quiz_mobile/components/quiz/ScoreBoard.dart';
import 'package:geo_quiz_mobile/screens/HomeScreen.dart';

class FinalScore extends StatefulWidget {

  final List scoreBoard;
  FinalScore({super.key, required this.scoreBoard});

  @override
  State<FinalScore> createState() => _FinalScoreState();
}

class _FinalScoreState extends State<FinalScore> {
  var hits = 0;

  countHits(){
    for(var i = 0; i<widget.scoreBoard.length; i++){
      if(widget.scoreBoard[i] == true){
          hits++;
      }
    }
  }

  void popHome(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const HomeScreen();
        }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    countHits();
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text("Congratulations!", style: TextStyle(fontSize: 25),),
              Text("you got $hits questions right!", style: const TextStyle(fontSize: 25),)
            ],
          ),
          ElevatedButton(onPressed: () => popHome(context), child: const Text("back to home")),
          ScoreBoard(scoreBoard: widget.scoreBoard)
        ],
      )
    );
  }
}