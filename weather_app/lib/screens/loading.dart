import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3;
  late double longitude3;

  @override
  void initState(){
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    var weatherData = network.getJsonData();
    print(weatherData);
  }

  // void fetchData() async {
  //   http.Response response = await http.get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?'
  //       'q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
  //
  //   if(response.statusCode == 200){
  //     String jsonData = response.body;
  //     var parsingData = jsonDecode(jsonData);
  //     var myJson = parsingData['weather'][0]['description'];
  //     var myJson2 = parsingData['wind']['speed'];
  //     var myJson3 = parsingData['id'];
  //     print(myJson);
  //     print(myJson2);
  //     print(my Json3);
  //   }else{
  //     print(response.statusCode);
  //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            getLocation();
          },
          child: Text(
            'Get my location',
            style: TextStyle(
                color: Colors.white
              ),
            ),
        ),
      ),
    );
  }

