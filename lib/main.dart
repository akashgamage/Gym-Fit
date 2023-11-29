import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_application_1test2/pages/add/addmeal.dart';
// import 'package:flutter_application_1test2/pages/firstpages/Dashboard.dart';
// import 'package:flutter_application_1test2/pages/firstpages/LoginPage.dart';
// import 'package:flutter_application_1test2/pages/firstpages/MyMeals.dart';
// import 'package:flutter_application_1test2/pages/firstpages/Progress.dart';
// import 'package:flutter_application_1test2/pages/firstpages/home_page.dart';
// import 'package:flutter_application_1test2/pages/login.dart';
import 'package:flutter_application_1test2/pages/firstpages/Starting.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: StartingPage(),
    );
  }
}
