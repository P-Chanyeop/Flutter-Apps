import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';

class ToDoList extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ToDoList();
  }
}

class _ToDoList extends State<ToDoList> {
  List<bool> isSwitched2 = [false];
  final List<String> todoList = [];
  String input = "";
  int id = 0;


  @override
  Widget build(BuildContext context) {
    // String todoList = '';
    List<Widget> items = [
      ListTile(
        leading: Icon(Icons.local_airport, size: 50),
        title: Text('Airport'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_atm, size: 50),
        title: Text('ATM'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_bar, size: 50),
        title: Text('Bar'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_cafe, size: 50),
        title: Text('Cafe'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_car_wash, size: 50),
        title: Text('Car Wash'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_convenience_store, size: 50),
        title: Text('Heart Shaker'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_dining, size: 50),
        title: Text('Dining'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_drink, size: 50),
        title: Text('Drink'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_florist, size: 50),
        title: Text('Florist'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_gas_station, size: 50),
        title: Text('Gas Station'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_grocery_store, size: 50),
        title: Text('Grocery Store'),
        subtitle: Text('Description here'),
      ),
    ];

    return SafeArea(
        child: Scaffold(
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
            centerTitle: false,
            elevation: 0.2,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("할 일 추가 !!"),
                  content: TextField(
                    onChanged: (String value) {
                    input = value;
                    },
                  ),
                    actions: <Widget>[
                      ElevatedButton(onPressed: (){
                        setState(() {
                          todoList.add(input);
                          isSwitched2.add(false);
                        });
                        Navigator.of(context).pop();	// input 입력 후 창 닫히도록
                       },
                          child: Text("추가"))
                    ]
                );
                });
              },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
          body:ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(todoList[index]),
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(borderRadius:
                    BorderRadius.circular(8)
                    ),
                  child: ListTile(
                    leading: Text('${index+1}번째', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),),
                    title: Text(todoList[index], textAlign: TextAlign.left, selectionColor: Colors.blue),
                    // trailing: IconButton(icon: Icon(
                    //   Icons.delete,
                    //   color: Colors.red
                    //   ),
                    //     onPressed: () {
                    //       setState(() {
                    //         // todoList.removeAt(index);
                    //       });
                    //     }),
                    trailing: Switch(
                          value: isSwitched2[index],
                          onChanged: (value) {
                            setState(() {
                              isSwitched2[index] = value;
                            });
                          },
                          activeColor: Colors.blue,
                        ),

                  )
                  ));
            }),


          // Container(
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //         colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
          //         image: AssetImage('images/white_bg.jpg'),
          //         fit: BoxFit.cover,
          //       )
          //   ),
          //   padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
          //   child: Container(
          //     child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: <Widget>[
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: <Widget>[
          //           Text(
          //             '<< 할 일 추가 >> ',
          //             style: TextStyle(fontSize: 25.0,),
          //           ),
          //         ],
          //       ),
          //       SizedBox(height: 20.0,),
          //       TextField(
          //         maxLength: 50,
          //         obscureText: false,
          //         onSubmitted: (text) {
          //           if (text.length > 0 && text.length <= 50){
          //             setState(() {
          //               todoList.add(text);
          //             });
          //           }
          //         },
          //         decoration: InputDecoration(
          //           border: OutlineInputBorder(),
          //           labelText: "",
          //           helperText: "할일 추가는 요기 !_!",
          //           helperStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
          //         ),
          //       ),
          //       SizedBox(height: 50,),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text("hello"),
          //           Switch(
          //             value: isSwitched2,
          //             onChanged: (value) {
          //               setState(() {
          //                 isSwitched2 = value;
          //               });
          //             },
          //             activeColor: Colors.blue,
          //           ),
          //         ],
          //       ),
          //
          //     ],
          //   ),),
          // ),
        ),
    );
  }
}


