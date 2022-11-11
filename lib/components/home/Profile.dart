import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/playerApi.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> getUser() async {
      final data = await getRankingApi();
      Map<String, dynamic> user = data["user"];
      print(user);
      return user;
    }

    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: Image.asset(
              "assets/images/profile.jpeg",
            ),
          ),
          FutureBuilder(
            future: getUser(),
            builder: ((context, snapshot) {
              final e = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      e!["name"],
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hits ${e["hits"]}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Mistakes ${e["mistakes"]}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return const CircularProgressIndicator();
              }
              return Container();
            }),
          )
        ],
      )),
    );
  }
}
