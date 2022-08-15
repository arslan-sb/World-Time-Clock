import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:world_time_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {

   const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(region: 'Asia',city: 'Karachi',flag: 'Pakistan'),
    WorldTime(region: 'Europe', city: 'London', flag: 'england'),
    WorldTime(region: 'Europe', city: 'Berlin', flag: 'Germany'),
    WorldTime(region: 'Africa', city: 'Cairo', flag: 'egypt'),
    WorldTime(region: 'Africa', city: 'Nairobi', flag: 'kenya'),
    WorldTime(region: 'America', city: 'Chicago', flag: 'usa'),
    WorldTime(region: 'America', city: 'New_York', flag: 'usa'),
    WorldTime(region: 'Asia', city: 'Seoul', flag: 'KOR'),
    WorldTime(region: 'Asia', city: 'Jakarta', flag: 'indonesia'),
    WorldTime(region: 'Asia', city: 'kolkata', flag: 'india'),

  ];

  void updateTime(index)async{
    WorldTime instance=locations[index];
    await instance.getDateTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context,{
      'city':locations[index].city,
      'region':locations[index].region,
      'date':locations[index].date,
      'isDayTime':locations[index].isDayTime,
      'time':locations[index].time,
      'flag':locations[index].flag,
    });
  }

  @override
  Widget build(BuildContext context) {

    print("Build intialized");
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        centerTitle:true,
        title:const Text("Choose Location"),
      ),
      body: ListView.builder(
          itemCount: locations.length,
        itemBuilder: (context,index){
          String country=locations[index].flag??"pakistan";
            return  Padding(
              padding: const EdgeInsets.fromLTRB(5,4,4,5),
              child: Card (
                child: ListTile(
                  onTap: (){
                        updateTime(index);
                  },
                  title: Text(locations[index].city!),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://countryflagsapi.com/png/$country'),
                  ),
                ),
              ),
            );
        },
      )

    );
  }
}

