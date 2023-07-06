import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';

class Progress extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Progress();
  }
}
class _Progress extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          MyButton(image: Icon(Icons.home, size: 20,),
              text: Text("Home", style: TextStyle(color: Colors.black87, fontSize: 20.0),),
              color: Colors.white,
              onPressed: (){
                Navigator.popAndPushNamed(context, '/home');
              }
          ),
        ],
        backgroundColor: Colors.redAccent,
        title: Text(
          '나의 의지',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("이번달 목표 달성도! 🌟",),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
