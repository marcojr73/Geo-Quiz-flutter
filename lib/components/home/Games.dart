import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/components/home/GameLevels.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo.png", width: 50),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                GameLevels(type: "flags", image: "assets/images/flags.jpeg"),
                GameLevels(type: "capitals", image: "assets/images/mapcity.jpeg"),
                GameLevels(type: "territories", image: "assets/images/mapCountry.jpeg")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
