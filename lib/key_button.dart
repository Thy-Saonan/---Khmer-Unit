import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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

class Keys extends StatelessWidget {
  final String btntxt;
  final output;
  Keys(this.btntxt, this.output, theme) {
    darkTheme = theme;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        output(btntxt);
      },
      child: Container(
        padding: EdgeInsets.all(11),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  // color: Colors.white,
                  color: HexColor(darkColors[darkTheme]["upperShadow"]),
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: 1.0),
              BoxShadow(
                  // color: HexColor("#D1CDC7"),
                  color: HexColor(darkColors[darkTheme]["lowerShadow"]),
                  offset: Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: 1),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // HexColor("#FFFFFF"),
                HexColor(darkColors[darkTheme]["upperShadow"]),
                // HexColor("#D1CDC7"),
                HexColor(darkColors[darkTheme]["lowerShadow"]),

                // HexColor("#FFFFFF")
                HexColor(darkColors[darkTheme]["upperShadow"])
              ],
              stops: [0.2, 1, 1],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            btntxt,
            style: TextStyle(
              fontSize: 22,
              color: HexColor(darkColors[darkTheme]["textColor"]),
            ),
          ),
        ),
      ),
    );
  }
}
