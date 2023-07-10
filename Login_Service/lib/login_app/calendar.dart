import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:login_service/my_button/my_button.dart';
import 'package:table_calendar/src/table_calendar_base.dart';
import 'package:login_service/utils.dart';
class Calendar extends StatefulWidget {
  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  String _selectedTime = '';
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
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
              centerTitle: false,
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
              child:
              Column(
                children: [
                  TableCalendar<Event>(
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    rangeStartDay: _rangeStart,
                    rangeEndDay: _rangeEnd,
                    calendarFormat: _calendarFormat,
                    rangeSelectionMode: _rangeSelectionMode,
                    eventLoader: _getEventsForDay,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      // Use `CalendarStyle` to customize the UI
                      outsideDaysVisible: false,
                    ),
                    onDaySelected: _onDaySelected,
                    onRangeSelected: _onRangeSelected,
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: ValueListenableBuilder<List<Event>>(
                      valueListenable: _selectedEvents,
                      builder: (context, value, _) {
                        return ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                onTap: () => print('${value[index]}'),
                                title: Text('${value[index]}'),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              // Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // children: [
                  // Padding(
                    // padding: EdgeInsets.only(top: 30),
                  //
                  //   child: TableCalendar(
                  //     firstDay: DateTime(2021, 10, 16),
                  //     lastDay: DateTime(2030, 3, 14),
                  //     daysOfWeekHeight: 20,
                  //     focusedDay: _focusedDay,
                  //     calendarFormat: _calendarFormat,
                  //     selectedDayPredicate: (day) {
                  //       // Use `selectedDayPredicate` to determine which day is currently selected.
                  //       // If this returns true, then `day` will be marked as selected.
                  //
                  //       // Using `isSameDay` is recommended to disregard
                  //       // the time-part of compared DateTime objects.
                  //       return isSameDay(_selectedDay, day);
                  //     },
                  //       onDaySelected: (selectedDay, focusedDay) {
                  //         if (!isSameDay(_selectedDay, selectedDay)) {
                  //           // Call `setState()` when updating the selected day
                  //           setState(() {
                  //             _selectedDay = selectedDay;
                  //             _focusedDay = focusedDay;
                  //           });
                  //         }
                  //       },
                  //       onFormatChanged: (format) {
                  //         if (_calendarFormat != format) {
                  //           // Call `setState()` when updating calendar format
                  //           setState(() {
                  //             _calendarFormat = format;
                  //           });
                  //         }
                  //       },
                  //       onPageChanged: (focusedDay) {
                  //         // No need to call `setState()` here
                  //         _focusedDay = focusedDay;
                  //       },
                  //   ),
                  // ),
                  // SizedBox(height: 50,),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.orangeAccent,
                  //       foregroundColor: Colors.white
                  //   ),
                  //   onPressed: () {
                  //     Future<TimeOfDay?> selectedTime = showTimePicker(
                  //       initialTime: TimeOfDay.now(),
                  //       context: context,
                  //     );
                  //
                  //     selectedTime.then((timeOfDay) {
                  //       setState(() {
                  //         String AMPM = '';
                  //         if (timeOfDay?.periodOffset == 0){
                  //           AMPM = 'AM';
                  //         }else {
                  //           AMPM = 'PM';
                  //         }
                  //
                  //         if (timeOfDay?.hour == null ){
                  //           _selectedTime = '';
                  //         }else{
                  //           _selectedTime = '${timeOfDay?.hourOfPeriod}  :  ${timeOfDay?.minute}   ${AMPM}';
                  //         }
                  //       });
                  //     });
                  //   },
                  //   child: Text(
                  //     '시간 선택 !_!', style: TextStyle(fontSize: 20.0,),
                  //   ),
                  // ),
                  // SizedBox(height: 30,),
                  // Text(
                  //   '$_selectedTime',
                  //   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.blueAccent),
                  // ), // color - 막대 그래프의 색깔
              //   ],
              // ),
            )
        )
    );
  }
}
