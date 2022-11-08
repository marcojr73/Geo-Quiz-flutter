import 'package:flutter/material.dart';

class GameLevels extends StatelessWidget {
  final String image;
  const GameLevels({super.key, required this.image});

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
                        onPressed: () {}, child: const Text("Easy")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Medium")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Hard")),
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
