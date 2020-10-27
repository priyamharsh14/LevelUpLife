import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BoxCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  BoxCard({this.icon, this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.white),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Icon(
              icon,
              size: 25.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 7.0,
          ),
          label.text.xl
              .fontFamily("Oswald")
              .textStyle(TextStyle(shadows: [
                Shadow(
                  blurRadius: 7.5,
                  color: Colors.black,
                )
              ]))
              .center
              .color(Colors.white)
              .makeCentered(),
        ],
      ),
    );
  }
}
