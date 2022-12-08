import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/api/playerApi.dart';
import 'package:geo_quiz_mobile/models/RankingModel.dart';
import 'package:geo_quiz_mobile/utils/showError.dart';

class Ranking extends StatefulWidget {
  const Ranking({super.key});

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  List<dynamic> data = [];

  Future getRanking(context) async {
    final response = await getRankingApi();
    if (response == 500) {
      showError(context, "there was an error loading");
      return;
    }
    setState(() {
      data = response["weekScore"];
    });
  }

  @override
  Widget build(BuildContext context) {
    getRanking(context);
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
            data.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height * 1,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: ((context, index) {
                            final e = data[index];
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
                  )
          ],
        ),
      ),
    );
  }
}



// FutureBuilder(
//               future: getRanking(context),
//               builder: ((context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 }
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return 
//                 }
//                 if (snapshot.hasError) {
//                   print(snapshot.error.toString());
//                   return const CircularProgressIndicator();
//                 }
//                 return Container();
//               }),
//             )