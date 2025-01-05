import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:my_first_program/UserDashboard/Home/Home.dart';
import 'consts.dart';


void main() async{
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(const HealthcareApp());
}
class HealthcareApp extends StatelessWidget {
  const HealthcareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage(),
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Colors.deepPurple,  // Deep purple background color
      //     titleTextStyle: TextStyle(color: Colors.white), // White text color
      //     iconTheme: IconThemeData(color: Colors.white),  // White icons
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
    );
  }
}

