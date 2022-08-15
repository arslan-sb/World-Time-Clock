import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    String bgImage="null";
    try {
      data = data.isNotEmpty ? data : ModalRoute
          .of(context)!
          .settings
          .arguments as Map;
      bgImage= data['isDayTime']
          ? 'https://source.unsplash.com/random/?day'
          : 'https://source.unsplash.com/random/?night';
      //print(data);
      //print(bgImage);
    }
    catch(e){
      print(e);

    }
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            Navigator.pushReplacementNamed(context, '/');
          });
        },
        child:const Text("Reload"),
      ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(bgImage),
                  fit: BoxFit.cover,
              ),
          ),
          padding:const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton.icon(
                  onPressed: ()async{
                     dynamic result=await Navigator.pushNamed(context, '/location');
                     setState((){
                       data={
                         'city':result['city'],
                         'region':result['region'],
                         'date':result['date'],
                         'isDayTime':result['isDayTime'],
                         'time':result['time'],
                         'flag':result['flag'],
                       };
                     });
                  },
                  icon: Icon(Icons.edit_location_alt,
                  color: Colors.greenAccent[100],),
                label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.greenAccent[100],
                    ),
                ),

              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['city'],
                    style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 10,),
              Text(
                data['time'],
                style:const TextStyle(
                  fontSize: 60.0,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                data['date'],
                style:const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
    );
  }
}
