import 'package:flutter/material.dart';
import 'package:schoolevents/constant/const.dart';

class MyLogin extends StatelessWidget {
  MyLogin({super.key});

  final _Username = TextEditingController();
  final _Password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: bluecolor),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _Username,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter your name";
                } else if (value.length <= 5) {
                  return "enter more than 5 characters";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                prefix: const Icon(Icons.person, color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'username',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _Password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter your password";
                } else if (value.length <= 5) {
                  return "enter more than 5 characters";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                prefix: const Icon(Icons.password, color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _submit();
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(bluecolor)),
              child: Text(
                'Login',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {}
  }
}
