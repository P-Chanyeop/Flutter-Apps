import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';
import 'package:login_service/my_button/none_image_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController id = TextEditingController();
  TextEditingController pw1 = TextEditingController();
  TextEditingController pw2 = TextEditingController();
  TextEditingController email = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            MyButton(image: Icon(Icons.home, size: 20,),
                text: Text("Login", style: TextStyle(color: Colors.black87, fontSize: 20.0),),
                color: Colors.white,
                onPressed: (){
                  Navigator.popAndPushNamed(context, '/login');
                }
            ),
          ],
          backgroundColor: Colors.cyan,
          title: Text(
            '회원가입',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
          centerTitle: false,
          elevation: 0.2,
        ),
        body:Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("어서오세요! 현생 다이어리에",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 30.0),),
              Text("오신것을 환영해요!  :)",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 30.0),),
              SizedBox(height: 20,),
              TextFormField(
                maxLength: 15,
                obscureText: false,
                controller: id,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ID",
                  helperText: "아이디를 입력해주세요.",
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                maxLength: 15,
                obscureText: false,
                controller: pw1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    helperText: "비밀번호를 입력해주세요.",
                    errorText: "비밀번호가 일치하지않아요!!"
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                maxLength: 15,
                obscureText: false,
                controller: pw2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password 확인",
                  helperText: "비밀번호를 다시 입력해주세요.",
                ),
                validator: (val){
                  if (pw2 == ""){
                    print("비밀번호가 비어있음");

                  }else{
                    print("good");
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                maxLength: 15,
                obscureText: false,
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  helperText: "이메일을 입력해주세요.",
                ),
              ),
              SizedBox(height: 10,),
              NoneImageButton(
                  text: Text(
                    "회 원 가 입",
                    style: TextStyle(color: Colors.black87, fontSize: 15.0),
                  ),
                  color: Colors.white,
                  onPressed: (){

                      Navigator.popAndPushNamed(context, "/login");
                    }
              ),
            ],
          ),
        ),
      ),
    );
  }

}



