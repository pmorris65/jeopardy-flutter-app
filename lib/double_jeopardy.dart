import 'package:flutter/material.dart';
import 'package:jeopardy_app/final_jeopardy_wager.dart';

class DoubleJeopardy extends StatelessWidget {
  const DoubleJeopardy({super.key, required this.score});
  final jeopardyBlue = const Color.fromRGBO(9, 19, 131, 1);
  final int score;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Double Jeopardy!',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Double Jeopardy!'),
          backgroundColor: jeopardyBlue,
        ),
        body: Center(
          child: ScoreKeeper(
            score: score,
          ),
        ),
      ),
    );
  }
}

class ScoreKeeper extends StatefulWidget {
  ScoreKeeper({super.key, required this.score});

  int score;

  @override
  State<ScoreKeeper> createState() => ScoreKeeperState();
}

class ScoreKeeperState extends State<ScoreKeeper> {
  int dailyDouble = 0;
  final jeopardyBlue = const Color.fromRGBO(9, 19, 131, 1);

  void _increment(int amount) {
    setState(() {
      widget.score += amount;
    });
  }

  void _decrement(int amount) {
    setState(() {
      widget.score -= amount;
    });
  }

  void _reset() {
    setState(() {
      widget.score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('\$${widget.score}',
              style: const TextStyle(
                  fontSize: 18,
                  height:
                      2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                  color: Colors.green, //font color
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: jeopardyBlue, // Background color
              fixedSize: const Size(300, 50),
            ),
            onPressed: () => _increment(400),
            child: const Text('\$400'),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: jeopardyBlue, // Background color
              fixedSize: const Size(300, 50),
            ),
            onPressed: () => _increment(800),
            child: const Text('\$800'),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: jeopardyBlue, // Background color
              fixedSize: const Size(300, 50),
            ),
            onPressed: () => _increment(1200),
            child: const Text('\$1200'),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: jeopardyBlue, // Background color
              fixedSize: const Size(300, 50),
            ),
            onPressed: () => _increment(1600),
            child: const Text('\$1600'),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: jeopardyBlue, // Background color
              fixedSize: const Size(300, 50),
            ),
            onPressed: () => _increment(2000),
            child: const Text('\$2000'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 143, 1), // Background color
                  fixedSize: const Size(146, 50),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        alignment: Alignment.center,
                        height: 425,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText:
                                        'How Much Would You Like to Wager?',
                                  ),
                                  onChanged: (String value) {
                                    dailyDouble = int.parse(value);
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .greenAccent, // Background color
                                        ),
                                        child: const Text(
                                            'Correct'), //TODO add input field
                                        onPressed: () => {
                                          _increment(dailyDouble),
                                          Navigator.pop(context),
                                          dailyDouble = 0
                                        },
                                      )),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .redAccent, // Background color
                                        ),
                                        child: const Text(
                                            'Incorrect'), //TODO add input field
                                        onPressed: () => {
                                          _decrement(dailyDouble),
                                          Navigator.pop(context),
                                          dailyDouble = 0,
                                        },
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Daily Double'),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: jeopardyBlue, // Background color
                  fixedSize: const Size(146, 50),
                ),
                onPressed: _reset,
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: jeopardyBlue, // Background color
              fixedSize: const Size(300, 50),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FinalJeopardyWager(score: widget.score),
                ),
              );
            },
            child: const Text('Final Jeopardy!  --->'), //TODO add arrow icon
          ),
        ),
      ],
    );
  }
}
