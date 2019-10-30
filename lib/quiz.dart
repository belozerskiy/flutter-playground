import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int currentQuestionIndex;
  final Function handlePressAnswer;

  Quiz({
    @required this.questions,
    @required this.currentQuestionIndex,
    @required this.handlePressAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(
          questions[currentQuestionIndex]['question'],
        ),
        ...(questions[currentQuestionIndex]['answers'] as List).map((answer) {
          return Answer(
            answer['text'],
            () => handlePressAnswer(answer['score']),
          );
        }),
      ],
    );
  }
}
