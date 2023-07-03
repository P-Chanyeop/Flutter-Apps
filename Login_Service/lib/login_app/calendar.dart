// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:login_service/my_button/my_button.dart';

class Calendar extends StatefulWidget {
  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  String _selectedTime = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          MyButton(image: Icon(Icons.home, size: 20,),
              text: Text("Home", style: TextStyle(color: Colors.black87, fontSize: 20.0),),
              color: Colors.white,
              onPressed: (){
                Navigator.popAndPushNamed(context, '/home');
              }
          ),
        ],
        backgroundColor: Colors.cyan,
        title: Text(
          '할 일 캘린더',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: TableCalendar(
                firstDay: DateTime(2021, 10, 16),
                lastDay: DateTime(2030, 3, 14),
                daysOfWeekHeight: 20,
                focusedDay: DateTime.now(),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white
              ),
              onPressed: () {
                Future<TimeOfDay?> selectedTime = showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                selectedTime.then((timeOfDay) {
                  setState(() {
                    String AMPM = '';
                    if (timeOfDay?.periodOffset == 0){
                      AMPM = 'AM';
                    }else {
                      AMPM = 'PM';
                    }

                    if (timeOfDay?.hour == null ){
                      _selectedTime = '';
                    }else{
                      _selectedTime = '${timeOfDay?.hourOfPeriod}  :  ${timeOfDay?.minute}   ${AMPM}';
                    }
                  });
                });
              },
              child: Text(
                '시간 선택 !_!', style: TextStyle(fontSize: 20.0,),
              ),
            ),
            SizedBox(height: 30,),
            Text(
                '$_selectedTime',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.blueAccent),
            ),
          ],
        ),
      )
    );
  }
}
