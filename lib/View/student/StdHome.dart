import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolevents/View/student/EventApply.dart';
import 'package:schoolevents/View/student/EventResult.dart';
import 'package:schoolevents/View/student/result.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  bool isToggled = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(
                  isToggled ? 'events' : 'results') // Dynamic collection
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text('Oops! Something went wrong..'),
              );
            }

            var data = snapshot.data?.docs;

            if (data == null || data.isEmpty) {
              return Center(
                child: Text(
                  isToggled ? 'No Events Found' : 'No Results Found',
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Text(
                      isToggled ? "Event" : "Result",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var item = data[index];

                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04,
                              vertical: size.height * 0.01,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 16, 93, 156),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.event,
                                  color: Colors.blue,
                                  size: size.width * 0.1,
                                ),
                                title: Text(
                                  isToggled
                                      ? item['eventname'] // Event name field
                                      : item['result'], // Result field
                                  style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                onTap: () {
                                  if (isToggled) {
                                    // Navigate to EventDetail page
                                    Get.to(() => StudentEventDetail(
                                          eventName: item['eventname'],
                                        ));
                                  } else {
                                    // Navigate to ResultDetail page
                                    Get.to(() => StudentResultDetails(
                                          eventName: item['result'],
                                        ));
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: isToggled ? 4 : 3,
                          child: MaterialButton(
                            minWidth: size.width * 0.4,
                            onPressed: () {
                              setState(() {
                                isToggled = true;
                              });
                            },
                            color: isToggled
                                ? Colors.amber
                                : const Color(0xFF103D9C),
                            elevation: isToggled ? 4 : 0,
                            height: size.height * 0.07,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Event",
                              style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.bold,
                                color: isToggled ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: isToggled ? 4 : 3,
                          child: MaterialButton(
                            minWidth: size.width * 0.4,
                            onPressed: () {
                              setState(() {
                                isToggled = false;
                              });
                            },
                            color: isToggled
                                ? const Color(0xFF103D9C)
                                : Colors.amber,
                            elevation: isToggled ? 0 : 4,
                            height: size.height * 0.07,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Result",
                              style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.bold,
                                color: isToggled ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 95),
          child: FloatingActionButton(
            backgroundColor: Colors.yellowAccent,
            onPressed: () {
              Get.to(EventApply());
            },
            child: const Icon(
              Icons.add,
              color: Colors.indigo,
            ),
          ),
        ),
      ),
    );
  }
}
