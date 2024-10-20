import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/World_time.dart';
import 'package:flutter/material.dart';

class Load extends StatefulWidget {

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {

   void getter() async
   {
       WorldTime obj=WorldTime(location: 'London' ,url: 'Europe/London',flag:'london.png' );

         await obj.getTime();
         Navigator.pushReplacementNamed(context, '/home',arguments: {
           'location':obj.location,
           'flag':obj.flag,
           'time':obj.time,
           'url':obj.url,
           'isdaytime':obj.isdaytime,
         });
   }

  @override
  void initState() {
    super.initState();
    getter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitCubeGrid(
            size: 80.0,
            color: Colors.white,
          ),
        ),
    );







  }
}
