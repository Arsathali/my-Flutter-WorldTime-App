import 'package:flutter/material.dart';
import 'package:world_time/services/World_time.dart';


class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

 List<WorldTime> locations=[
   WorldTime(location: 'London' ,url: 'Europe/London',flag:'london.png' ),
   WorldTime(location: 'Vancouver' ,url: 'America/Vancouver',flag:'download.jpeg' ),
   WorldTime(location: 'Moscow' ,url: 'Europe/Moscow',flag:'moscow.png' ),
   WorldTime(location: 'New York' ,url: 'America/New_York',flag:'usa.png' ),
   WorldTime(location: 'Sydney' ,url: 'Australia/Sydney',flag:'australia.jpeg' ),
   WorldTime(location: 'Tokyo' ,url: 'Asia/Tokyo',flag:'japan.png' ),
   WorldTime(location: 'Berlin' ,url: 'Europe/Berlin',flag:'germany.png' ),
   WorldTime(location: 'Sao Paulo' ,url: 'America/Sao_Paulo',flag:'brazil.jpeg' ),
   WorldTime(location: 'Kolkata' ,url: 'Asia/Kolkata',flag:'india.png' ),
   WorldTime(location: 'Shanghai' ,url: 'Asia/Shanghai',flag:'china.png' ),
   WorldTime(location: 'Seoul' ,url: 'Asia/Seoul',flag:'south koria.png' ),
   WorldTime(location: 'Johannesburg' ,url: 'Africa/Johannesburg',flag:'south africa.png' ),
   WorldTime(location: 'Paris' ,url: 'Europe/Paris',flag:'france.png' ),

 ];

 void getdata(index) async{
     WorldTime obj=locations[index];
     
    await obj.getTime();

    //pass the data
   Navigator.pop(context,{
     'location':obj.location,
     'flag':obj.flag,
     'time':obj.time,
     'url':obj.url,
     'isdaytime':obj.isdaytime,
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Choose The Location',
        style: TextStyle(
            fontSize: 20.0,
        ),
      ),
        ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
           return Padding(
             padding: const EdgeInsets.fromLTRB(0.0,8.0,0.0,0.0),
             child: Card(
                child: ListTile(
                   onTap: (){
                     getdata(index);
                   },
                  title: Text(locations[index].location,
                  style: TextStyle(
                      fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    radius: 25.0,
                  ),
                ),
             ),
           );
          }
      )
      );

  }
}
