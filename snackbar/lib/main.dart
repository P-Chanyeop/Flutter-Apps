import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "snackbar/toast app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: ToastPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
        centerTitle: true,
      ),
      body: Builder(
          builder: (BuildContext ctx) {
        body: return Center(
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Hello'),
                action: SnackBarAction(
                  label: 'exit',
                  onPressed: () {},
                ),
              ));
            },
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 15, color: Colors.white)
                ),
                backgroundColor: MaterialStateProperty.all(Colors.blue)
            ),
            child: Text('ElevatedButton'),
          ),
        );
        },
      )
    );
  }
}

class MyPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
        centerTitle: true,
      ),
      body: MySnackBar(),
    );
  }
}

class MySnackBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
            Text('Hello',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white
              ),
            ),
            backgroundColor: Colors.cyan,
            duration: Duration(milliseconds: 1000),
          ),
          );
        },
        child: Text('Show me'),
      ),
    );
  }
}

class ToastPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast Message'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            flutterToast();
          },
          child: Text('Toast'),
        ),
      ),
    );
  }
}

void flutterToast(){
  Fluttertoast.showToast(msg: 'Flutter!',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
    fontSize: 20.0,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT
  );
}