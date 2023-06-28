import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';
import 'package:login_service/my_button/none_image_button.dart';
import 'package:login_service/login_app/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          MyButton(image: Icon(Icons.home, size: 20,),
              text: Text("Home", style: TextStyle(color: Colors.black87, fontSize: 15.0),),
              color: Colors.white,
              onPressed: (){
                Navigator.popAndPushNamed(context, '/home');
              }
          ),
        ],
        backgroundColor: Colors.cyan,
        title: Text(
            '로그인 및 회원가입',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: _buildButton(),
    );
  }

  Widget _buildButton() {



    return Padding(
      padding: EdgeInsets.all(100.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // ID, Password 입력란 start
          TextField(
            maxLength: 15,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "ID",
              helperText: "아이디를 입력해주세요.",
            ),
          ),

          SizedBox(height: 20,),

          TextField(
            maxLength: 15,
            obscureText: true,

            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "PASSWORD",
              helperText: "비밀번호를 입력해주세요.",

            ),
          ),
          // ID, Password 입력란 end

          SizedBox(height: 20,),

          // 로그인 및 회원가입 버튼 start
          NoneImageButton(
              text: Text(
                "로 그 인",
                style: TextStyle(color: Colors.black87, fontSize: 15.0,),
              ),
              color: Colors.white,
              onPressed: (){}
          ),

          SizedBox(height: 5,),

          NoneImageButton(
              text: Text(
                "회 원 가 입",
                style: TextStyle(color: Colors.black87, fontSize: 15.0),
              ),
              color: Colors.white,
              onPressed: (){}
          ),

          // 로그인 및 회원가입 버튼 end
          SizedBox(
              height: 40,
              child: Text(".\n.\n")
          ),

          MyButton(image: Image.asset('images/glogo.png'),
              text: Text("Login with Google",
                  style: TextStyle(color: Colors.black87, fontSize: 15.0)),
              color: Colors.white,
              onPressed: (){}
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(image: Image.asset('images/flogo.png'),
              text: Text("Login with Facebook",
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              color: Colors.blueAccent,
              onPressed: (){}
          ),
          SizedBox(
            height: 10.0,
          ),
          MyButton(image: Icon(Icons.email, size: 40,),
              text: Text("Login with Email",
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              color: Colors.grey,
              onPressed: (){}
          ),
        ],
      ),
    );
  }
}


