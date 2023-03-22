import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// imutable한 특징을 유지
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}


// mutable한 속성을 제공
class MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              // Text위젯은 Statless위젯이다
              // build 메소드를 호출하기 위해 setState 메소드를 호출한다
              SizedBox(
                height: 10.0,
              ),
              Text(
                  '$counter',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.plus_one),
                    onPressed: (){
                      // 숫자의 증가를 감지해 state를 변경해준다. 변경되는 위젯 => dirty
                      setState(() {
                        counter++;
                        print("$counter");
                      });
                    },
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.exposure_minus_1),
                    onPressed: (){
                      // 숫자의 증가를 감지해 state를 변경해준다. 변경되는 위젯 => dirty
                      setState(() {
                        counter--;
                        print("$counter");
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


