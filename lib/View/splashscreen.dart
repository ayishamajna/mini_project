import 'package:flutter/material.dart';

class MySplash extends StatelessWidget {
  //  void initState() {
  //   super.initState();
  //   (
  //     const Duration(seconds: 3),
  //     () {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const MyLogin()),
  //       );
  //     }
  //   );
  // }
  const MySplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 50, 84),
      body: Center(
        child: Image.asset('assets/school_logo.png'),
      ),
    );
  }
}
