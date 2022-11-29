import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/congrats_screen.dart';
import 'package:flutter_quiz/screens/question_screen.dart';
import 'package:flutter_quiz/screens/start_screen.dart';
import 'package:flutter_quiz/services/firestore.dart';
import 'package:flutter_quiz/services/models.dart';
import 'package:flutter_quiz/widgets/loading.dart';
import 'package:flutter_quiz/widgets/progress_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'quiz_state.dart';

class QuizScreen extends StatelessWidget {
  final String quizId;
  const QuizScreen({super.key, required this.quizId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizState(),
      child: FutureBuilder<Quiz>(
        future: FirestoreService().getQuiz(quizId),
        builder: (context, snapshot) {
          var state = Provider.of<QuizState>(context);

          if (!snapshot.hasData || snapshot.hasError) {
            return const Loader();
          } else {
            var quiz = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                title: ProgressBar(
                  value: state.progress,
                ),
                leading: IconButton(
                  icon: const Icon(FontAwesomeIcons.xmark),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: PageView.builder(
                controller: state.controller,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return StartScreen(quiz: quiz);
                  } else if (index == quiz.questions.length) {
                    return CongratsScreen(quiz: quiz);
                  } else {
                    return QuestionScreen(question: quiz.questions[index - 1]);
                  }
                },
                onPageChanged: (int index) =>
                    state.progress = (index / (quiz.questions.length + 1)),
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
              ),
            );
          }
        },
      ),
    );
  }
}
