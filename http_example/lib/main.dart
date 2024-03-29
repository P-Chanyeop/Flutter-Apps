import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _callAPI() async {
    var url = Uri.parse(
      'http://localhost:8080/user/qkrcksduq1gh',
    );
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    //
    // url = Uri.parse('https://reqbin.com/sample/post/json');
    // response = await http.post(url, body: {
    //   'key': 'value',
    // });
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: _callAPI,
              child: const Text('Call API'),
            ),
        ],
      ),
    );
  }
}