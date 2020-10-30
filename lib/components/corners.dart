import 'package:flutter/material.dart';

List<Widget> getImageCorners(double height) {
  return [
    Positioned(
      top: 0,
      left: 0,
      child: RotatedBox(
        quarterTurns: 0,
        child: Image.asset(
          'assets/images/corner.png',
          height: height,
        ),
      ),
    ),
    Positioned(
      top: 0,
      right: 0,
      child: RotatedBox(
        quarterTurns: 1,
        child: Image.asset(
          'assets/images/corner.png',
          height: height,
        ),
      ),
    ),
    Positioned(
      left: 0,
      bottom: 0,
      child: RotatedBox(
        quarterTurns: 3,
        child: Image.asset(
          'assets/images/corner.png',
          height: height,
        ),
      ),
    ),
    Positioned(
      right: 0,
      bottom: 0,
      child: RotatedBox(
        quarterTurns: 2,
        child: Image.asset(
          'assets/images/corner.png',
          height: height,
        ),
      ),
    ),
  ];
}

List<Widget> getLineCorners(double padding, double width) {
  return [
    Positioned(
      left: padding,
      top: padding,
      child: RotatedBox(
        quarterTurns: 0,
        child: Container(
          color: Colors.blue[300],
          width: width,
          height: 1,
        ),
      ),
    ),
    Positioned(
      left: padding,
      top: padding,
      child: RotatedBox(
        quarterTurns: 1,
        child: Container(
          color: Colors.blue[300],
          width: width,
          height: 1,
        ),
      ),
    ),
    Positioned(
      right: padding,
      bottom: padding,
      child: RotatedBox(
        quarterTurns: 0,
        child: Container(
          color: Colors.blue[300],
          width: width,
          height: 1,
        ),
      ),
    ),
    Positioned(
      right: padding,
      bottom: padding,
      child: RotatedBox(
        quarterTurns: 1,
        child: Container(
          color: Colors.blue[300],
          width: width,
          height: 1,
        ),
      ),
    ),
  ];
}
