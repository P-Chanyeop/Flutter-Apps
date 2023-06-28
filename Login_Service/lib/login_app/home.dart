import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: Text(
          '현재의 생각,,, ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Container(
        child: Column(
          children: [
            Text("hello world!"),
            MyButton(image: Icon(Icons.email, size: 40,),
                text: Text("Login",
                    style: TextStyle(color: Colors.black87, fontSize: 15.0)),
                color: Colors.white,
                onPressed: (){
                  Navigator.popAndPushNamed(context, '/login');
                }
            ),
          ],
        ),
      ),
    );
  }
}
