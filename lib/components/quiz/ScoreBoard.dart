import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {

  final List scoreBoard;
  const ScoreBoard({super.key, required this.scoreBoard});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < scoreBoard.length; i++)
                scoreBoard[i] == true
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 40,
                      )
                    : const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 40,
                      ),
            ],
          );
  }
}