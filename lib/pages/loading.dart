
import 'package:flutter/material.dart';
import 'package:world_time_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


    void getWorldTime()async{
      WorldTime instance= WorldTime(region: 'Asia',city: 'Karachi',flag: 'Pakistan');
      await instance.getDateTime();
      //returning properties of worldtime to home
       // ignore: use_build_context_synchronously
       Navigator.pushReplacementNamed(context, '/home',arguments: {
        'flag':instance.flag,
        'city': instance.city,
        'region':instance.region,
        'time':instance.time,
         'date': instance.date,
         'isDayTime':instance.isDayTime,
      });

    }
  @override
  void initState() {
    super.initState();
    getWorldTime();

  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      backgroundColor: Colors.blueGrey[900],

      body:const Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
