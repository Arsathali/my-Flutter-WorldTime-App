import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime{

     String location='';
     String time='';
     String url='';
     String flag='';
     bool isdaytime=true; //true or false


     WorldTime({required this.location,required this.url,required this.flag,});

     Future<void> getTime() async{

        Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
          // print(response.body);
        try {
          if (response.statusCode == 200) {

            Map data = jsonDecode(response.body);


            String datetime = data['dateTime'];
            // String offset = data['utc_offset'].substring(1, 3);

            DateTime now = DateTime.parse(datetime);
            // print(now);


            isdaytime= now.hour > 6 && now.hour < 20 ?true:false;

            time =DateFormat.jm().format(now);

          }

        }catch(e){
          time='error';
          print('error');
        }


     }

}