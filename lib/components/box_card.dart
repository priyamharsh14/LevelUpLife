import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BoxCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final double height;
  final double width;

  BoxCard({this.icon, this.label, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
        color: color,
      ),
      child: VStack(
        [
          Icon(
            icon,
            size: 25.0,
            color: Colors.white,
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
        alignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
