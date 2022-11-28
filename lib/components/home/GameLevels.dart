import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/screens/GameScreen.dart';
import 'package:geo_quiz_mobile/utils/AppRouters.dart';

class GameLevels extends StatelessWidget {
  final String image;
  final String type;
  const GameLevels({super.key, required this.image, required this.type});

  void PopQuestions(BuildContext context, String type, String level){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return GameScreen(type: type, level: level,);
        }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        children: [
          Image.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () => PopQuestions(context, type, "easy"), child: const Text("Easy")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () => PopQuestions(context, type, "medium"), child: const Text("Medium")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () => PopQuestions(context, type, "hard"), child: const Text("Hard")),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
