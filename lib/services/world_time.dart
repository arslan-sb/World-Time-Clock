import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String? region;
  String? city;
  String? time;
  String? flag;
  String? date;
  bool? isDayTime;
  WorldTime({this.region,this.flag,this.city});

  Future<void> getDateTime() async {
    try {
      Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$region/$city'));
      //print(response);
      Map data = jsonDecode(response.body);
      //(data);
      //print(data);
      String dateTime = data['dateTime'];
      //print(dateTime);

      DateTime now = DateTime.parse(dateTime);

      isDayTime=now.hour>6&&now.hour<19? true:false;
      time=DateFormat.jm().format(now);
      date=data['date'];
      //print(now);
    }
    catch(e){
        print("Error loading");
        time="Could not get Time";
        date="Could not get date";
    }
  }

}