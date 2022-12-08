import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/playerApi.dart';
import 'package:geo_quiz_mobile/utils/showError.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic> data = {};

  Future getUser(context) async {
    final response = await getRankingApi();
    if (response == 500) {
      showError(context, "there was an error loading");
      return;
    }
    setState(() {
      data = response["user"];
    });

    Map<String, dynamic> user = response["user"];
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    getUser(context);
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Center(
          child: Container(
        margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Image.asset(
                "assets/images/profile.jpeg",
              ),
            ),
            data.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        data["name"],
                        style: const TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hits ${data["hits"]}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Mistakes ${data["mistakes"]}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  )
          ],
        ),
      )),
    );
  }
}
