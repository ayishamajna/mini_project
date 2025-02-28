import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schoolevents/View/Organizer/appeal_list.dart';
import 'package:schoolevents/widgets/button.dart';
import 'package:schoolevents/widgets/textformfield.dart';

class UpdateResult extends StatefulWidget {
  const UpdateResult({super.key});

  @override
  State<UpdateResult> createState() => _UpdateResultState();
}

class _UpdateResultState extends State<UpdateResult> {
  final TextEditingController _eventName = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      Get.back();
                    }),
                SizedBox(width: size.width * 0.2),
                Text(
                  "update result",
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            RegisterTextformfield(
              text: "Eventname",
              controller: _eventName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your event name';
                }
                return null;
              },
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.05,
                ),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: _description,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your event name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8 * (size.width / 350),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: size.width * 0.2,
                    horizontal: size.width * 0.06,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.05,
                ),
                Text(
                  "image",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              height: size.height * 0.17,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8 * (size.width / 350)),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            CustomButton(
              text: "Submit",
              onpressed: () {
                Get.to(AppealList());
              },
            )
          ],
        ),
      ),
    );
  }
}
