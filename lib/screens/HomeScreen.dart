import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/components/home/Games.dart';
import 'package:geo_quiz_mobile/components/home/Profile.dart';
import 'package:geo_quiz_mobile/components/home/Ranking.dart';
import 'package:geo_quiz_mobile/components/signInUp/SignIn.dart';
import 'package:geo_quiz_mobile/components/signInUp/SignUp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedScreenIndex = 0;
  final List<Map<String, Object>> screens = [
    {"title": "Ranking", "screen": const Ranking()},
    {"title": "Games", "screen": const Games()},
    {"title": "Profile", "screen": const Profile()},
  ];

  selectScreen(int index){
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedScreenIndex].cast()["screen"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.primary,
          icon: const Icon(
            Icons.emoji_events,
          ),
          label: "Ranking" ,
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.primary,
          icon: const Icon(
            Icons.public,
          ),
          label: "Games" ,
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.primary,
          icon: const Icon(
            Icons.person,
          ),
          label: "Profile" ,
        ),
      ],)
    );
  }
}