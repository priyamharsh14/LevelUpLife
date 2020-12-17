import 'package:LifeReboot/screens/dashboard.dart';
import 'package:LifeReboot/screens/intro.dart';
import 'package:LifeReboot/screens/welcome.dart';
import 'package:LifeReboot/screens/registration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeReboot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'IntroPage',
      routes: {
        'WelcomePage': (context) => WelcomePage(),
        'RegisterPage': (context) => RegistrationPage(),
        'IntroPage': (context) => IntroPage(),
        'DashboardPage': (context) => DashboardPage(),
      },
    );
  }
}
