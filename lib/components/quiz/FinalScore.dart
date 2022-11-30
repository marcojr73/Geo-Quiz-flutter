import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    countHits();
    return Center(
      child: Text("Congratualitions my little friend, you're right $hits",)
    );
  }
}