import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StudentDetail extends StatelessWidget {
  final String studentName;

  const StudentDetail(
      {super.key,
      required this.studentName,
      required studentid,
      required department,
      required phoneNumber});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios, size: size.width * 0.06),
                    ),
                    SizedBox(
                      width: size.height * 0.08,
                    ),
                    Text(
                      "Student Detail",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: size.height * 0.08),
                CircleAvatar(
                  radius: size.width * 0.12,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                SizedBox(height: size.height * 0.04),
                Text(
                  " $studentName",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: size.height * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "ID Number",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "0000",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Department",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "ComputerScience",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.08),
                    Text(
                      "Ph No",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: size.width * 0.29),
                    Text(
                      "7594083016",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.09),
                    Text(
                      "Event name:",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: size.width * 0.21),
                    Text(
                      "Ground",
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
