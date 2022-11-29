import 'package:flutter/material.dart';
import 'package:flutter_quiz/services/firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/models.dart';

class CongratsScreen extends StatelessWidget {
  final Quiz quiz;
  const CongratsScreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Congratz! You completed the ${quiz.title} quiz",
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Image.asset("assets/congrats.gif"),
          const Divider(),
          ElevatedButton.icon(
              onPressed: () {
                FirestoreService().updateUserReport(quiz);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/topics", (route) => false);
              },
              icon: const Icon(FontAwesomeIcons.check),
              label: const Text("Marks Complete!"))
        ],
      ),
    );
  }
}
