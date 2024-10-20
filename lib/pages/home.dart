import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {



    final  datafrom = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map?;

    //checking if we can use this data
    if (datafrom != null) {
      data=datafrom;
    }


    String backimage= data['isdaytime'] ? 'morning.jpg':'night.jpg';
    Color upcolor=data['isdaytime']? Colors.indigo: Colors.black;


    return Scaffold(
      backgroundColor: upcolor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/$backimage"),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
              child: Column(
                children: [
                  Image(
                      image: AssetImage('assets/${data['flag']}'),
                    width: 100,
                    height: 100,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() async {
                       dynamic result= await Navigator.pushNamed(context, '/location');
                           setState(() {
                                data={
                                  'location':result['location'],
                                  'time':result['time'],
                                   'url':result['url'],
                                  'flag':result['flag'],
                                  'isdaytime':result['isdaytime'],
                                };
                           });
                      });
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Edit the Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                         data['location'],
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 80.0,
                           letterSpacing: 7.0,
                         ),
                       )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      letterSpacing: 4.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
// }