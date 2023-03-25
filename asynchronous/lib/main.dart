import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asynchronous',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Asynchronous(),
    );
  }
}

class Asynchronous extends StatelessWidget {
  const Asynchronous({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
