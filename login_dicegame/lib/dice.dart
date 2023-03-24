import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Page'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Image.asset("images/dice$leftDice.png")
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: Image.asset("images/dice$rightDice.png")
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor:  Colors.orange),
                onPressed: (){
                  setState(() {
                    leftDice = Random().nextInt(6) + 1;
                    rightDice = Random().nextInt(6) + 1;

                    if(leftDice == rightDice){
                      showToast("이겼습니다!");
                    }
                  });
                },
                child: Icon(Icons.play_arrow, color: Colors.white,
                size: 50,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showToast(String message){
  Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5
  );
}