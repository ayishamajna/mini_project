import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:schoolevents/Regular.dart/splashscreen.dart';
import 'package:schoolevents/View/Organizer/Add_Result.dart';
import 'package:schoolevents/View/Organizer/organizer_home.dart';
import 'package:schoolevents/View/Organizer/organizer_login.dart';
import 'package:schoolevents/View/student/stdRegster.dart';
import 'package:schoolevents/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySplash(),
    );
  }
}
