import 'package:flutter/material.dart';
import 'package:login_service/my_button/my_button.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Progress extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Progress();
  }
}
class _Progress extends State<Progress> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final List<ChartData> chartData = [
    ChartData("월", 35),
    ChartData("화", 23),
    ChartData("수", 34),
    ChartData("목", 25),
    ChartData("금", 40),
    ChartData("토", 40),
    ChartData("일", 40),
  ];


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            backgroundColor: Colors.redAccent,
            title: Text(
              '나의 의지',
              style: TextStyle(
                color: Colors.black87,
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
            padding: EdgeInsets.fromLTRB(15, 50, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "이번달 목표 달성도! 🌟",
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 30.0,
                    animationDuration: 1500,
                    percent: 0.8,
                    center: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("80.0%", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),),
                        AnimatedIcon(
                          icon: AnimatedIcons.event_add,
                          progress: animation,
                          size: 25.0,
                          semanticLabel: 'Show menu',
                        ),
                      ],
                    ),
                    barRadius: const Radius.circular(16),
                    progressColor: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("hello"),
                        SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            series: <CartesianSeries>[
                              // ??? 매달을 주차별로 나누어야하는 문제를 해결해야한다....
                              ColumnSeries<ChartData, String>(
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  // sortingOrder: SortingOrder.descending,
                                  // Sorting based on the specified field
                                  sortFieldValueMapper: (ChartData data, _) => data.x
                              )
                            ]
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
