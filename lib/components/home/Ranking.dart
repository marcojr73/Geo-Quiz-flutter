import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/playerApi.dart';
import 'package:geo_quiz_mobile/models/RankingModel.dart';

class Ranking extends StatefulWidget {
  const Ranking({super.key});

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  Future <List<dynamic>> getRanking() async {
    final data = await getRankingApi();
    List<dynamic> rank = data["weekScore"];
    return rank;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
      color: Theme.of(context).colorScheme.secondary,
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.emoji_events,
              size: 100,
              color: Colors.amber,
            ),
            const Text(
              "The best Players of day",
              style: TextStyle(fontSize: 25),
            ),
            FutureBuilder(
              future: getRanking(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height * 1,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            final e = snapshot.data![index];
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e["name"],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${e["weekScore"]}  pontos",
                                    style: const TextStyle(fontSize: 20),
                                  )
                                ]);
                          })),
                    ),
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
        ),
      ),
    );
  }
}
