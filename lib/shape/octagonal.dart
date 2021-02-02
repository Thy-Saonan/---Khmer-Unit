import 'package:flutter/material.dart';

class Octagonal extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    // var oneThirdHeight = size.height / 3.0;
    // var oneThirdWidth = size.width / 12.0;
    final path = Path()
      ..lineTo(0.0, h / 3)
      ..lineTo(w * 1 / 9, 0.0)
      ..lineTo(w * 8 / 9, 0.0)
      ..lineTo(w, h / 3)
      ..lineTo(w, h * 2 / 3)
      ..lineTo(w * 8 / 9, h)
      ..lineTo(w * 1 / 9, h)
      ..lineTo(0.0, h * 2 / 3)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
