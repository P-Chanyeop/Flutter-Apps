import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(''
            'Sign In',
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
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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


