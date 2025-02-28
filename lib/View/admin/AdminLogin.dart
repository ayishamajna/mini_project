import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolevents/View/admin/Admin.dart';
import 'package:schoolevents/View/admin/admin_Home.dart';
import 'package:schoolevents/constant/const.dart';
import 'package:schoolevents/sevices/auth_service.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  final _username = TextEditingController();
  final Password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/school_logo.png'),
                  SizedBox(height: 20),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: bluecolor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your username";
                      } else if (value != 'MAJNA') {
                        return "INVALID USERNAME";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefix: const Icon(Icons.person, color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: Password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your password";
                      } else if (value != '123456') {
                        return "INCORRECT PASSWORD";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefix: const Icon(Icons.password, color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => AdminBottomNavigationBar());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 12, 94, 161)),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
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
