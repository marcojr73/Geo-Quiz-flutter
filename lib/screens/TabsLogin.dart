import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/components/signInUp/SignIn.dart';
import 'package:geo_quiz_mobile/components/signInUp/SignUp.dart';

class TabsLogin extends StatefulWidget {
  const TabsLogin({super.key});

  @override
  State<TabsLogin> createState() => _TabsLoginState();
}

class _TabsLoginState extends State<TabsLogin> {

  int selectedScreenIndex = 0;
  final List<Map<String, Object>> screens = [
    {"title": "Sign-in", "screen": const SignIn()},
    {"title": "Sign-up", "screen": SignUp()}
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
            Icons.person_add,
          ),
          label: "Sign-In" ,
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.primary,
          icon: const Icon(
            Icons.person_add,
          ),
          label: "Sign-Up" ,
        ),
      ],)
    );
  }
}