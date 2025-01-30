import 'package:flutter/material.dart';
import 'package:schoolevents/View/student/StdHome.dart';
import 'package:schoolevents/constant/const.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phonenum = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _idnum = TextEditingController();
  TextEditingController _department = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 440.0),
            child: Text('Name'),
          ),
          TextFormField(
            controller: _name,
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
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 430.0),
            child: Text('Phone No'),
          ),
          TextFormField(
            controller: _phonenum,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter your phone number";
              } else if (value.length <= 5) {
                return "enter atleast 10 digits";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 470.0),
            child: Text("Email"),
          ),
          TextFormField(
            controller: _email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter your Email ID";
              } else if (value.length <= 5) {
                return "enter your valid id";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 430.0),
            child: Text('ID Number'),
          ),
          TextFormField(
            controller: _idnum,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter your ID Number";
              } else if (value.length <= 3) {
                return "enter your valid id";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 430.0),
            child: Text('Department'),
          ),
          TextFormField(
            controller: _department,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter your Department";
              } else if (value.length <= 5) {
                return "enter your correct department name";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          ElevatedButton(
            onPressed: () {
              _submit();
            },
            style:
                ButtonStyle(backgroundColor: WidgetStatePropertyAll(bluecolor)),
            child: Text(
              'submit',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StudentHomeScreen()));
    }
  }
}
