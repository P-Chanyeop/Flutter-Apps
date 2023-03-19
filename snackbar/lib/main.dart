import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "snackbar app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyPage(),
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


