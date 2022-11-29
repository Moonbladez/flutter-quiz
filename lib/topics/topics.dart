import 'package:flutter/material.dart';
import 'package:flutter_quiz/widgets/bottom_navigation.dart';
import './../services/firestore.dart';
import './../services/models.dart';
import "./../widgets/loading.dart";
import "./../widgets/error.dart";
import "./topic_item.dart";
import 'topic_drawer.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          } else if (snapshot.hasError) {
            return const ErrorMessage();
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;
            return Scaffold(
              bottomNavigationBar: BottomNavigation(),
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: const Text("Topics"),
              ),
              body: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                padding: const EdgeInsets.all(20.0),
                primary: false,
                children: topics
                    .map(
                      (topic) => TopicItem(
                        topic: topic,
                      ),
                    )
                    .toList(),
              ),
              drawer: TopicDrawer(topics: topics),
            );
          } else {
            return const Text("No topics found in database");
          }
        },
        future: FirestoreService().getTopics());
  }
}
