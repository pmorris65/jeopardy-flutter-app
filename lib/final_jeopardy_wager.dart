import 'package:flutter/material.dart';

class FinalJeopardyWager extends StatelessWidget {
  const FinalJeopardyWager({super.key, required this.score});
  final jeopardyBlue = const Color.fromRGBO(9, 19, 131, 1);
  final int score;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Jeopardy!',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Final Jeopardy!'),
          backgroundColor: jeopardyBlue,
        ),
        body: Center(
          child: Wager(
            score: score,
          ),
        ),
      ),
    );
  }
}

class Wager extends StatefulWidget {
  Wager({super.key, required this.score});

  int score;

  @override
  State<Wager> createState() => WagerState();
}

class WagerState extends State<Wager> {
  final jeopardyBlue = const Color.fromRGBO(9, 19, 131, 1);
  int wager = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'How Much Would You Like to Wager?',
            ),
            onChanged: (String value) {
              wager = int.parse(value);
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: jeopardyBlue, // Background color
              ),
              child: const Text('Submit'),
              onPressed: () => {}, //TODO navigate to write in answer
            )),
      ],
    );
  }
}
