import 'package:flutter/material.dart';
import 'package:schoolevents/Regular.dart/choose.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserChoice()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 73, 132),
      body: Center(
        child: Image.asset('assets/school_logo.png'),
      ),
    );
  }
}
