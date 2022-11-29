import 'package:flutter/material.dart';

import 'package:flutter_quiz/widgets/progress_bar.dart';
import 'package:provider/provider.dart';

import '../services/models.dart';

class TopicProgress extends StatelessWidget {
  final Topic topic;

  const TopicProgress({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    return Row(
      children: [
        _progressCount(report, topic),
        Expanded(
          child: ProgressBar(
            value: _calculateProgress(topic, report),
            height: 8,
          ),
        )
      ],
    );
  }
}

Widget _progressCount(Report report, Topic topic) {
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Text(
      '${report.topics[topic.id]?.length ?? 0} / ${topic.quizzes.length}',
      style: const TextStyle(fontSize: 10, color: Colors.grey),
    ),
  );
}

double _calculateProgress(Topic topic, Report report) {
  try {
    int totalQuizzes = topic.quizzes.length;
    int completedQuizzes = report.topics[topic.id].length;
    return completedQuizzes / totalQuizzes;
  } catch (err) {
    return 0.0;
  }
}
