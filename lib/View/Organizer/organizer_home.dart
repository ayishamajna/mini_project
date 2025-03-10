import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolevents/View/Organizer/Event_Edit.dart';
import 'package:schoolevents/View/Organizer/Organizer.dart';

class OrganizerHomepage extends StatefulWidget {
  const OrganizerHomepage({super.key});

  @override
  State<OrganizerHomepage> createState() => _OrganizerHomepageState();
}

class _OrganizerHomepageState extends State<OrganizerHomepage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 85, 141, 187),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.3,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        "Mohiniyattam",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          "Date :",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "  12/12/2021",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Text(
                          "Time :",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "  1:30 pm",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Text(
                          "Stage No:",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "  02",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: size.width * 0.04,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.5,
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(EventEdit());
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
         
          
        ],
      ),
    ));
  }
}
