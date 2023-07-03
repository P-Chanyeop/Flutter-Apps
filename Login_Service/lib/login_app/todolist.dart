import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';
import 'package:login_service/my_button/none_image_button.dart';
import 'package:login_service/login_app/home.dart';

class ToDoList extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ToDoList();
  }
}

class _ToDoList extends State<ToDoList> {
  final ScrollController _firstController = ScrollController();
  String todoList = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        actions: [
          MyButton(image: Icon(Icons.home, size: 20,),
          text: Text("Home",
          style: TextStyle(color: Colors.black87, fontSize: 20.0)),
          color: Colors.white,
          onPressed: (){
            Navigator.popAndPushNamed(context, '/home');
          }
          ),
        ],
        title: Text(
        '할 일 목록 ',
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
        ),
        ),
        centerTitle: true,
        elevation: 0.2,
    ),
      body:
      Container(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '<< 할 일 추가 >> ',
                  style: TextStyle(fontSize: 25.0,),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            TextField(
              maxLength: 50,
              obscureText: false,
              onSubmitted: (text) {
                if (text.length > 0 && text.length <= 50){
                  setState(() {
                  todoList = text;
                  });
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "",
                helperText: "할일 추가는 요기 !_!",
                helperStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
            Text(todoList),
          ],
        ),),
      ),
    );
  }
}


