import 'package:flutter/material.dart';
import 'package:calculator/key_button.dart';

// ignore: must_be_immutable
class Keyboard extends StatelessWidget {
  String output = '';
  final customFunc;
  bool darkTheme;
  Keyboard(this.customFunc, this.darkTheme);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 45, bottom: 10, left: 22, right: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Keys("7", customFunc, darkTheme)),
                Expanded(child: Keys("8", customFunc, darkTheme)),
                Expanded(child: Keys("9", customFunc, darkTheme)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Keys("4", customFunc, darkTheme)),
                Expanded(child: Keys("5", customFunc, darkTheme)),
                Expanded(child: Keys("6", customFunc, darkTheme)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Keys("3", customFunc, darkTheme)),
                Expanded(child: Keys("2", customFunc, darkTheme)),
                Expanded(child: Keys("1", customFunc, darkTheme)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Keys("0", customFunc, darkTheme)),
                Expanded(child: Keys(".", customFunc, darkTheme)),
                Expanded(child: Keys("C", customFunc, darkTheme)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
