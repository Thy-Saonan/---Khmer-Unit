import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'shape/octagonal.dart';

bool darkTheme = false;
var darkColors = {
  false: {
    "background": "EFEEEE",
    "lowerShadow": "#D1CDC7",
    "upperShadow": "#FFFFFF",
    "textColor": "#000000",
  },
  true: {
    "background": "#26282b",
    "lowerShadow": "#1f2123",
    "upperShadow": "#2d2e33",
    "textColor": "#d9d9d9",
  }
};

// ignore: must_be_immutable
class _InnerBox extends StatelessWidget {
  Widget boxChild;
  _InnerBox(this.boxChild);
  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      boxShadow: [
        BoxShadow(
          // color: Colors.white,
          color: HexColor(darkColors[darkTheme]["upperShadow"]),
          blurRadius: 1,
          spreadRadius: 2,
        )
      ],
      clipper: Octagonal(),
      child: Container(
        // color: HexColor("#EFEEEE"),
        color: HexColor(darkColors[darkTheme]["background"]),

        alignment: Alignment.center,
        child: boxChild,
      ),
    );
  }
}

// ignore: must_be_immutable
class _BoxLayout extends StatelessWidget {
  final height;
  final width;
  Widget boxChild;
  _BoxLayout(this.boxChild, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      boxShadow: <BoxShadow>[
        BoxShadow(
          // color: Colors.white,
          color: HexColor(darkColors[darkTheme]["upperShadow"]),
          blurRadius: 1,
          spreadRadius: 0,
          offset: Offset(-4, -4),
        ),
        BoxShadow(
          // color: HexColor("#D1CDC7"),
          color: HexColor(darkColors[darkTheme]["lowerShadow"]),
          blurRadius: 1,
          spreadRadius: 0,
          offset: Offset(4, 4),
        ),
      ],
      clipper: Octagonal(),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(0.02 * MediaQuery.of(context).size.width),
        // color: HexColor("#EFEEEE"),
        color: HexColor(darkColors[darkTheme]["background"]),

        child: _InnerBox(boxChild),
      ),
    );
  }
}

// ignore: must_be_immutable
class Box extends StatelessWidget {
  double height;
  var width;
  String text;
  String label;
  Widget boxChild;
  Box(theme, {double height = 100, double width = 100, Widget child}) {
    darkTheme = theme;
    this.height = height;
    this.width = width;
    boxChild = child;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        0.02 * MediaQuery.of(context).size.width,
      ),
      child: _BoxLayout(boxChild, height, width),
    );
  }
}
