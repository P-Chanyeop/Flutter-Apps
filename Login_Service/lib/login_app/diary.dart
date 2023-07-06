import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          MyButton(image: Icon(Icons.home, size: 20, color: Colors.white),
              text: Text("Home", style: TextStyle(color: Colors.white, fontSize: 20.0),),
              color: Colors.black87,
              onPressed: (){
                Navigator.popAndPushNamed(context, '/home');
              }
          ),
        ],
        backgroundColor: Colors.orangeAccent,
        title: Text(
          '다이어리',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Title 메뉴
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.menu_book_rounded, size: 100,),
                    Text(" 오늘의 일기 ! 🌟", style: TextStyle(color: Colors.orange, fontSize: 50, fontWeight: FontWeight.w600),),
                  ],
                ),
            SizedBox(height: 50,),
            // 현재의 생각, 일기 입력란 start
                TextField(
                  maxLines: 4,
                  maxLength: 140,
                  obscureText: false,
                  decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent, width: 3),
                  ),
                  icon: Icon(Icons.cloud_circle_rounded, size: 70, color: Colors.lightBlueAccent, ),
                  labelText: "현재의 생각은 . . .",
                  helperText: "현재의 생각, 현생 다이어리 🌟"
                ),
                ),

                SizedBox(height: 50,),

                TextField(
                  maxLines: 4,
                  maxLength: 140,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent, width: 3),
                      ),
                      icon: Icon(Icons.sunny_snowing, size: 70, color: Colors.redAccent,),
                      labelText: "오늘 하루는 어땠나요 ?",
                      helperText: "현재의 생각, 현생 다이어리 🌟"
                  ),
                ),
            ],
            ),
      )
    );
  }
}
