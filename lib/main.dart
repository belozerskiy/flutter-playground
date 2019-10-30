import 'package:flutter/material.dart';

import './quiz_container.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final title = 'Quiz';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: QuizContainer(),
      ),
    );
  }
}
