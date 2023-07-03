import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        actions: [
          MyButton(image: Icon(Icons.email, size: 20,),
              text: Text("Login",
                  style: TextStyle(color: Colors.black87, fontSize: 20.0)),
              color: Colors.white,
              onPressed: (){
                Navigator.popAndPushNamed(context, '/login');
              }
          ),
        ],
        title: Text(
          '현재의 생각,,, ',
          style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage('images/white_bg.jpg'),
            fit: BoxFit.cover,
          )
        ),
        margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("images/Hyeon_saeng.gif", width: 400, height: 150,),
                Text("현재의 생각\n현생 다이어리",textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0, color: Colors.orange),),
                Container(
                  margin: EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTheme(
                            height: 30.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10.0),
                                // 배경 색 설정
                                  backgroundColor: Colors.white,
                                // 글자 색상 및 애니메이션 색 설정
                                foregroundColor: Colors.black87,
                                // 글자 그림자 설정
                                shadowColor: Colors.black,
                                // 글자 3D 입체감 높이
                                elevation: 30.0,
                              ),
                              onPressed: (){
                                Navigator.popAndPushNamed(context, '/todolist');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                        "images/Todolist.gif",
                                        width: 100,
                                        height: 100,
                                  ),
                                  SizedBox(height: 5, width: 100,),
                                  Text(
                                    "할 일 목록",
                                    style: TextStyle(
                                      fontFamily: 'omyu',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),

                          ButtonTheme(
                            height: 50.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // 글자 패딩
                                padding: EdgeInsets.all(10.0),
                                backgroundColor: Colors.white,
                                // 글자 색상 및 애니메이션 색 설정
                                foregroundColor: Colors.black87,
                                // 글자 그림자 설정
                                shadowColor: Colors.black,
                                // 글자 3D 입체감 높이
                                elevation: 30.0,
                              ),
                              onPressed: (){
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/Diary.gif",
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(height: 5, width: 100,),
                                  Text(
                                    "다이어리",
                                    style: TextStyle(
                                    fontFamily: 'omyu',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTheme(
                            height: 50.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10.0),
                                backgroundColor: Colors.white,
                                // 글자 색상 및 애니메이션 색 설정
                                foregroundColor: Colors.black87,
                                // 글자 그림자 설정
                                shadowColor: Colors.black,
                                // 글자 3D 입체감 높이
                                elevation: 30.0,
                              ),
                              onPressed: (){},
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/Calendar.gif",
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(height: 5, width: 100,),
                                  Text(
                                      "달력",
                                    style: TextStyle(
                                      fontFamily: 'omyu',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          ButtonTheme(
                            height: 50.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10.0),
                                backgroundColor: Colors.white,
                                // 글자 색상 및 애니메이션 색 설정
                                foregroundColor: Colors.black87,
                                // 글자 그림자 설정
                                shadowColor: Colors.black,
                                // 글자 3D 입체감 높이
                                elevation: 30.0,
                              ),
                              onPressed: (){},
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/Progress.gif",
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(height: 5, width: 100,),
                                  Text(
                                      "진행도",
                                    style: TextStyle(
                                      fontFamily: 'omyu',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
