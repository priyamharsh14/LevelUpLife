import 'package:LevelUpLife/screens/welcome.dart';
import 'package:LevelUpLife/screens/registration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LevelUpLife',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'WelcomePage',
      routes: {
        'WelcomePage': (context) => WelcomePage(),
        'RegisterPage': (context) => RegistrationPage(),
      },
      home: WelcomePage(),
    );
  }
}
