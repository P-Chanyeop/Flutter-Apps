import 'package:flutter/material.dart';

import 'ScreenA.dart';

class  ScreenB extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ScreenB',
            style: TextStyle(
              fontSize: 24.0
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ScreenA()));
              },
              child: Text('Go to ScreenA'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/c');
              },
              child: Text('Go to ScreenC'),
            ),
          ],
        ),
      ),
    );
  }
}
