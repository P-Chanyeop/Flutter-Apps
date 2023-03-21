import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: MyPage2(),
    );
  }
}

class MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        // Container는 오직 하나의 child를 가진다
        child: Container(
          // child가 없을경우 Container는 가질수있는 최대한의 크기를 잡음
            color: Colors.red,
            width: 100,
            height: 100,
            margin: EdgeInsets.symmetric(
              vertical: 80,
              horizontal: 20,
            ),
            padding: EdgeInsets.all(40),
          // child 를 가진다면 child의 크기만큼만 갖는다
            child: Text('Hello'),
        ),
      ),
    );
  }
}

class MyPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.white,
              child: Text('Container 1'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              height: 100,
              color: Colors.blue,
              child: Text('Container 2'),
            ),
            Container(
              height: 100,
              color: Colors.red,
              child: Text('Container 3'),
            ),
            Container(
              height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}