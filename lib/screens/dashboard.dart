import 'package:LevelUpLife/components/corners.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Widget _temp = Container(
      child: "UNDER CONSTRUCTION"
          .text
          .xl
          .fontFamily("Oswald")
          .textStyle(TextStyle(shadows: [
            Shadow(
              blurRadius: 7.5,
              color: Colors.black,
            )
          ]))
          .center
          .color(Colors.yellow[600])
          .makeCentered(),
    );
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: TabBarView(
          children: [
            Material(
              color: Colors.black,
              child: Stack(
                children: [_temp],
              ),
            ),
            _temp,
            _temp,
            _temp,
            _temp
          ],
        ),
        bottomNavigationBar: TabBar(
          indicator: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(context.percentHeight * 2),
                bottomRight: Radius.circular(context.percentHeight * 2)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.blue.withOpacity(0.75),
                Colors.blue.withOpacity(0.50),
              ],
            ),
          ),
          tabs: [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Skills",
              icon: Icon(Icons.api),
            ),
            Tab(
              text: "Stats",
              icon: Icon(Icons.analytics),
            ),
            Tab(
              text: "Rewards",
              icon: Icon(Icons.emoji_events),
            ),
            Tab(
              text: "Settings",
              icon: Icon(Icons.settings),
            ),
          ],
          labelColor: Colors.blue[50],
          unselectedLabelColor: Colors.blue,
        ),
      ),
    );
  }
}
