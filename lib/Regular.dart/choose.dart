import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schoolevents/View/Organizer/organizer_login.dart';
import 'package:schoolevents/View/admin/AdminLogin.dart';
import 'package:schoolevents/View/student/stdlogin.dart';

class UserChoice extends StatefulWidget {
  const UserChoice({super.key});

  @override
  State<UserChoice> createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double responsiveHorizontalPadding = size.width * 0.3;
    double responsiveVerticalPadding = size.height * 0.017;

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: size.height * 0.25),
          Center(child: Text("Sign in as ")),
          SizedBox(
            height: size.height * 0.05,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveHorizontalPadding,
                    vertical: responsiveVerticalPadding,
                  ),
                  backgroundColor: Color.fromARGB(255, 15, 52, 82),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                Get.to(AdminLogin());
              },
              child: Text(
                "Admin",
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(
            height: size.height * 0.02,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveHorizontalPadding,
                    vertical: responsiveVerticalPadding,
                  ),
                  backgroundColor: Color.fromARGB(255, 15, 52, 82),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text(
                "Student",
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(
            height: size.height * 0.02,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveHorizontalPadding,
                    vertical: responsiveVerticalPadding,
                  ),
                  backgroundColor: Color.fromARGB(255, 15, 52, 82),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                Get.to(OrganizerLogin());
              },
              child: Text(
                "Organizer",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    ));
  }
}
