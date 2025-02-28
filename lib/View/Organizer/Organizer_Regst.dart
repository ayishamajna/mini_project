import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolevents/View/Organizer/organizer_login.dart';
import 'package:schoolevents/View/student/StdHome.dart';
import 'package:schoolevents/View/student/stdlogin.dart';
import 'package:schoolevents/constant/const.dart';
import 'package:schoolevents/sevices/auth_service.dart';

class OrganizerRegst extends StatefulWidget {
  const OrganizerRegst({super.key});

  @override
  State<OrganizerRegst> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<OrganizerRegst> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phonenum = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _idnum = TextEditingController();
  final TextEditingController _department = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _name.dispose();
    _phonenum.dispose();
    _email.dispose();
    _password.dispose();
    _idnum.dispose();
    _department.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('Phone Number'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _phonenum,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  } else if (value.length != 10) {
                    return "Enter valid phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('Email'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                      .hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('Password'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  } else if (value.length < 6) {
                    return "Enter at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('ID Number'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _idnum,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your ID Number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('Department'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _department,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Department";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _handleRegistration,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(bluecolor),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleRegistration() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final result = await AuthServices().OrganizerReg(
          name: _name.text.trim(),
          email: _email.text.trim(),
          password: _password.text,
          idnumber: _idnum.text.trim(),
          department: _department.text.trim(),
          phoneno: _phonenum.text.trim(),
        );

        if (result != null) {
          Get.off(() => OrganizerLogin());
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Registration failed. Please try again."),
              ),
            );
          }
        }
      } catch (e) {
        log('Registration error: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString().contains('firebase')
                  ? "Registration failed. Please check your details and try again."
                  : e.toString()),
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }
}
