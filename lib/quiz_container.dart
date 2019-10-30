import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

class QuizContainer extends StatefulWidget {
  @override
  _QuizContainerState createState() => _QuizContainerState();
}

class _QuizContainerState extends State<QuizContainer> {
  final finishText = 'You did it!';
  final _questions = [
    {
      'question': 'What\'s your favorite show?',
      'answers': [
        {
          'text': 'Day Break',
          'score': 10,
        },
        {
          'text': 'Lost',
          'score': 5,
        },
        {
          'text': 'Heroes',
          'score': 1,
        },
      ],
    },
    {
      'question': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Cat',
          'score': 10,
        },
        {
          'text': 'Dog',
          'score': 1,
        },
      ],
    },
    {
      'question': 'What\'s your favorite food?',
      'answers': [
        {
          'text': 'Burger',
          'score': 10,
        },
        {
          'text': 'Pizza',
          'score': 5,
        },
        {
          'text': 'Buritto',
          'score': 3,
        },
        {
          'text': 'Meat',
          'score': 100,
        },
      ],
    }
  ];

  var _currentQuestionIndex = 0;
  var _isQuizFinish = false;
  var _currentScore = 0;

  _restartQuiz() {
    setState(() {
      _resetQuestionIndex();
      _resetScore();
      _isQuizFinish = false;
    });
  }

  _incrementCurrentQuestionIndex() {
    _currentQuestionIndex += 1;
  }

  _resetQuestionIndex() {
    _currentQuestionIndex = 0;
  }

  _resetScore() {
    _currentScore = 0;
  }

  _calculateScore(int score) {
    _currentScore += score;
  }

  void _handlePressAnswer(int score) {
    setState(
      () {
        _calculateScore(score);
        if (_currentQuestionIndex < _questions.length - 1) {
          _incrementCurrentQuestionIndex();
        } else {
          _isQuizFinish = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return !_isQuizFinish
        ? Quiz(
            questions: _questions,
            currentQuestionIndex: _currentQuestionIndex,
            handlePressAnswer: _handlePressAnswer,
          )
        : Result(
            _currentScore,
            _restartQuiz,
          );
  }
}
