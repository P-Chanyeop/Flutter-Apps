import 'package:flutter/material.dart';
import 'login_app/login.dart';
import 'login_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/login',
      routes: {
        '/home' : (context) => Home(),
        '/login' : (context) => Login(),
      },
      home: Login(),
    );
  }
}

