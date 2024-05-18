import 'package:http/http.dart';
import 'dart:convert';


class worker
{

  //Constructor
  worker(this.location)
  {
    location=this.location;
  }

  String temp='t';
  String location='t';
  String humidity='t';
  String air_speed='t';
  String description='t';
  String main='t';
  String icon='t';

  Future<void> getData() async {

    try
        {
          Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=34e1fdcb211422c72a12d908350b4c03"));
          Map data = jsonDecode(response.body);
          
          print(data);

          //temp details
          Map temp_data=data['main'];
          double getTemp=temp_data['temp']-273.15;


          //air speed details
          Map wind =data['wind'];
          double getAir_speed=wind['speed']/0.27777777777778;


          //humidity details
          String getHumidity= temp_data['humidity'].toString();


          //description and main details
          List weather_data=data['weather'];
          Map weather_main_data=weather_data[0];
          String getMain_des=weather_main_data['main'];
          String getDesc=weather_main_data["description"];
          print(icon);
          print("T");


          //Assigning values
          temp=getTemp.toString();
          humidity=getHumidity;
          air_speed=getAir_speed.toString();
          description=getDesc;
          main=getMain_des;
          icon = weather_main_data["icon"].toString();
          print(icon);

        }catch(e)
    {
      temp="NA";
      humidity="NA";
      air_speed="NA";
      description="Can't Find Data";
      main="NA";
      icon = "09d";
    }


  }
}