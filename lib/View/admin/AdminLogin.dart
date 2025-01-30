import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolevents/View/admin/adminhome.dart';
import 'package:schoolevents/constant/const.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  final Username = TextEditingController();
  final Password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                  controller: Username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your name";
                    } else if (value.length <= 5) {
                      return "enter more than 5 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefix: const Icon(Icons.person, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'username',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: Password,
                  validator: (value) {
                    if (Password.text == null || Password.text.isEmpty) {
                      return "please enter your password";
                    } else if (Password.text.length <= 5) {
                      return "enter more than 5 characters";
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
                    _submit(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 94, 161)),
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
    );
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Get.to(() => AdminHomepage());
    }
  }
}
