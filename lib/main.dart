import 'package:LevelUpLife/welcome.dart';
import 'package:flutter/material.dart';
import 'screens/registration_screen.dart';

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
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
      home: WelcomePage(),
    );
  }
}
