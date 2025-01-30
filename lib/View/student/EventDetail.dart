import 'package:flutter/material.dart';
import 'package:schoolevents/View/student/EventResult.dart';
import 'package:schoolevents/View/student/result.dart';
import 'package:schoolevents/constant/const.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          'Event Detail',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color.fromARGB(255, 171, 213, 247),
                  child: Icon(Icons.person,
                      size: 60, color: const Color.fromARGB(255, 64, 162, 241)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Mohiniyattam'),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220.0),
                  child: Row(
                    children: [
                      Text('Date'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '18/07/23',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 220),
                  child: Row(
                    children: [
                      Text('Stage No:'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '02',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220.0),
                  child: Row(
                    children: [
                      Text('Time'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '1:30 pm',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Location'),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'ground',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {
              _next('name');
            },
            child: Text(
              'Apply',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            style:
                ButtonStyle(backgroundColor: WidgetStatePropertyAll(bluecolor)),
          )
        ],
      ),
    );
  }

  void _next(String evnt) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StudentResultDetails(
                  eventName: evnt,
                )));
  }
}
