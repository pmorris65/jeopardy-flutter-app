import 'package:flutter/material.dart';
import 'double_jeopardy.dart';

class Jeopardy extends StatefulWidget {
  const Jeopardy({super.key});

  @override
  State<Jeopardy> createState() => JeopardyCountersState();
}

class JeopardyCountersState extends State<Jeopardy> {
  int _counter = 0;
  int dailyDouble = 0;
  final jeopardyBlue = const Color.fromRGBO(9, 19, 131, 1);

  void _increment(int amount) {
    setState(() {
      _counter += amount;
    });
  }

  void _decrement(int amount) {
    setState(() {
      _counter -= amount;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('\$$_counter',
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
            onPressed: () => _increment(200),
            child: const Text('\$200'),
          ),
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
            onPressed: () => _increment(600),
            child: const Text('\$600'),
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
            onPressed: () => _increment(1000),
            child: const Text('\$1000'),
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
                  builder: (context) => DoubleJeopardy(score: _counter),
                ),
              );
            },
            child: const Text('Double Jeopardy!  --->'), //TODO add arrow icon
          ),
        ),
      ],
    );
  }
}
