import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schoolevents/View/admin/Events.dart';
import 'package:schoolevents/widgets/button.dart';
import 'package:schoolevents/widgets/textformfield.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventName = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _stageNo = TextEditingController();
  final TextEditingController _time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.08),
                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminEvent()),
                            );
                          }),
                      SizedBox(width: screenWidth * 0.2),
                      Text(
                        "Add Event",
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  RegisterTextformfield(
                    text: " Event Name",
                    controller: _eventName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Event Name is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  RegisterTextformfield(
                    text: "Date",
                    controller: _dateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Date is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  RegisterTextformfield(
                    text: "Stage No",
                    controller: _stageNo,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the stage number ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  RegisterTextformfield(
                    text: "Time",
                    controller: _time,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Time is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.26),
                  CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(AdminEvent());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminEvent(),
                          ),
                        );
                      }
                    },
                    text: 'Submit',
                    onpressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
