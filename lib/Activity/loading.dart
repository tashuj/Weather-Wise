import 'package:flutter/material.dart';
import 'package:mausam/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  String city='Jaipur';
  String temp='t';
  String hum='t';
  String air_speed='t';
  String des='t';
  String main='t';
  String icon='t';

  void startApp(String city) async
  {
    worker inst = worker(city);
    await inst.getData();

    temp=inst.temp;
    hum=inst.humidity;
    air_speed=inst.air_speed;
    des=inst.description;
    main=inst.main;
    icon=inst.icon;

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        "temp_value" : temp,
        "humidity_value" : hum,
        "air_speed_value" : air_speed,
        "description_value" : des,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city,
      });
    });


  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 170,),
              Image.asset("assets/images/logo_h_apna.png",height: 240,width: 240 ,),
              Text("Mausam App",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 10,),
              Text("Made by Tashu Jain",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),),
          SizedBox(height: 30,),
          SpinKitWave(
            color: Colors.black45,
            size: 50.0,
          ),
            ],
          ),
        ),
      ),
          backgroundColor: Colors.blue[200],
    );
  }
}
