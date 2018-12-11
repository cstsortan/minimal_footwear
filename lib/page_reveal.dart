import 'package:flutter/material.dart';
import 'dart:math';

class RevealClipper extends CustomClipper<Rect> {
  final double percentage;

  RevealClipper(this.percentage);

  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width/2, size.height * 19/20),
      radius: sqrt(pow(size.width, 2) + pow(size.height, 2)) * percentage,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class PageReveal extends StatelessWidget {
  final double percentage;
  final Widget child;
  const PageReveal({Key key, this.percentage, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: child,
      clipper: RevealClipper(percentage),
    );
  }
}