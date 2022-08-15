

import 'package:flutter/material.dart';
import 'package:world_time_clock/pages/home.dart';
import 'package:world_time_clock/pages/loading.dart';
import 'package:world_time_clock/pages/choose_location.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
    title: "World Time",
    //home: Home(),
    initialRoute: '/',
    routes:{
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),
    },
  ));

}

