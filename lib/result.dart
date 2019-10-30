import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function restartHandler;

  Result(this.score, this.restartHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'You did it!',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Score is: $score',
            style: TextStyle(fontSize: 32),
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: restartHandler,
          )
        ],
      ),
    );
  }
}
