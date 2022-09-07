// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'jeopardy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final jeopardyBlue = const Color.fromRGBO(9, 19, 131, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeopardy!',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Jeopardy!'),
          backgroundColor: jeopardyBlue,
        ),
        body: const Center(
          child: Jeopardy(),
        ),
      ),
    );
  }
}
