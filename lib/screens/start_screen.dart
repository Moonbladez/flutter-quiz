import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz/quiz_state.dart';
import 'package:flutter_quiz/services/models.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.quiz});
  final Quiz quiz;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            quiz.title,
            style: Theme.of(context).textTheme.headline4,
          ),
          const Divider(),
          Expanded(
            child: Text(quiz.description),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: state.nextPage,
                icon: const Icon(Icons.poll),
                label: const Text("Start Quiz"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
