import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice game",
      home: Login(),
    );
  }
}


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController dice = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Center(
            child: Image(
              image: AssetImage('images/chef.gif'),
              width: 170.0,
              height: 190.0,
            ),
          ),
          Form(
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 15.0
                      ),
                    ),
                ),
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Builder(
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: dice,
                              decoration: InputDecoration(
                                labelText: 'Enter "dice"',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: password,
                              decoration: InputDecoration(
                                labelText: 'Enter Password',
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            ButtonTheme(
                              minWidth: 100,
                              height: 50.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                ),
                                onPressed: () {
                                  if (dice.text == "dice" &&
                                      password.text == "1234") {
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => Dice())
                                    );
                                  }
                                  else {
                                    showSnackBar(context);
                                  }
                                },
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 45.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}


void showSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('로그인 정보를 다시 확인하세요.',
          textAlign: TextAlign.center),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.blue,
      )
  );
}