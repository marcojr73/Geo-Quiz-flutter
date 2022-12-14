import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/screens/GameScreen.dart';
import 'package:geo_quiz_mobile/screens/HomeScreen.dart';
import 'package:geo_quiz_mobile/screens/TabsLogin.dart';
import 'package:geo_quiz_mobile/utils/AppRouters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: const Color(0xFFEA6363),secondary: const Color(0xFFD9D9D9)),
          fontFamily: "Coustard"
        ),
      routes: {
        AppRouters.signUp: (ctx) => const TabsLogin(),
        AppRouters.home: (ctx) => const HomeScreen(),
      },
    );
  }
}
