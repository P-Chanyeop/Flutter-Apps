import 'package:flutter/material.dart';
import 'ScreenA.dart';
import 'ScreenB.dart';
import 'ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Navigator',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => ScreenA(),
        '/b' : (context ) => ScreenB(),
        '/c' : (context ) => ScreenC(),
      },
    );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context2){
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to the Second page'),
          onPressed: (){
            Navigator.push(context2, MaterialPageRoute(
                builder: (_) => SecondPage()));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
    @override
    Widget build(BuildContext ctx) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
        child: Text('Go to the First page'),
        onPressed: (){
          Navigator.pop(ctx);
        },
        ),
        ),
      );
    }
}
