import 'package:calculator/keyboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:calculator/calculator_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(50.0),
    topRight: Radius.circular(50.0),
  );

  PanelController _pc = new PanelController();
  final GlobalKey _lKey = GlobalKey();
  Size boxSize = Size(0, 0);
  double height = 0;
  bool darkTheme = false;
  String output = "0";
  var selectedLanguage = "kh";
  var term = "length";
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
  Future _getIntFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final sDarkTheme = prefs.getBool('darkTheme');
    final sSelectedLanguage = prefs.getString('selectedLanguage');
    final sTerm = prefs.getString('term');
    final sOutput = prefs.getString('output');

    if (sDarkTheme == null) {
      darkTheme = false;
    } else {
      darkTheme = sDarkTheme;
    }
    if (sSelectedLanguage == null) {
      selectedLanguage = "kh";
    } else {
      selectedLanguage = sSelectedLanguage;
    }
    if (sTerm == null) {
      term = "length";
    } else {
      term = sTerm;
    }
    if (sOutput == null) {
      output = "0";
    } else {
      output = sOutput;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getIntFromSharedPref();
    SchedulerBinding.instance.addPostFrameCallback((_) => getSize());
  }

  getSize() {
    RenderBox _lBox = _lKey.currentContext.findRenderObject();
    setState(() => this.boxSize = _lBox.size);
  }

  void getHeight(h) {
    height = h;
  }

  void tapInputBox({inputbox = false}) {
    setState(() {
      if (inputbox) {
        _pc.open();
      }
    });
  }

  void changeOutput(newOutput) async {
    setState(() {
      if (newOutput == "C") {
        output = '0';
      } else if (newOutput == '.' &&
          output.indexOf('.') == -1 &&
          output.length < 9) {
        output += newOutput;
      } else if (newOutput != "." && output.length < 9) {
        if (output == '0') {
          output = newOutput;
        } else {
          output += newOutput;
        }
      }
    });
    final pref = await SharedPreferences.getInstance();
    await pref.setString("output", output);
  }

  onThemeChange(darkTheme) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("darkTheme", darkTheme);
    setState(() {
      this.darkTheme = darkTheme;
    });
  }

  onLanguageChange(selectedLanguage) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("selectedLanguage", selectedLanguage);
    setState(() {
      this.selectedLanguage = selectedLanguage;
    });
  }

  onTermChange(term) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("term", term);
    setState(() {
      this.term = term;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: HexColor("#EFEEEE"),
        backgroundColor: HexColor(darkColors[darkTheme]["background"]),
        body: SlidingUpPanel(
          controller: _pc,
          defaultPanelState: PanelState.OPEN,
          maxHeight: height -
              boxSize.height -
              this.height -
              MediaQuery.of(context).padding.top +
              -50,
          minHeight: 30,
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              // color: HexColor("#FFFFFF"),
              color: HexColor(darkColors[darkTheme]["upperShadow"]),

              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
          //keyboard drag bar
          header: GestureDetector(
            onTap: () {
              if (_pc.isPanelOpen) {
                _pc.close();
              } else if (_pc.isPanelClosed) {
                _pc.open();
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 0.4 * width, top: 15),
              width: 0.2 * width,
              height: 15,
              decoration: BoxDecoration(
                // color: HexColor("#EFEEEE"),
                color: HexColor(darkColors[darkTheme]["background"]),

                boxShadow: [
                  BoxShadow(
                      // color: HexColor("#FFFFFF"),
                      color: HexColor(darkColors[darkTheme]["upperShadow"]),
                      offset: Offset(-1.0, -1.0),
                      blurRadius: 1.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      // color: HexColor("#D1CDC7"),
                      color: HexColor(darkColors[darkTheme]["lowerShadow"]),
                      offset: Offset(1.0, 1.0),
                      blurRadius: 1.0,
                      spreadRadius: 1.0),
                ],
              ),
            ),
          ),
          //End of
          panel: Container(
            decoration: BoxDecoration(
              borderRadius: radius,
              // color: HexColor("EFEEEE"),
              color: HexColor(darkColors[darkTheme]["background"]),
            ),
            child: Keyboard(changeOutput, darkTheme),
          ),
          body: LengthUnitPage(
            _lKey,
            getHeight,
            output,
            darkTheme,
            selectedLanguage,
            term,
            tapInputBox,
            onThemeChange,
            onLanguageChange,
            onTermChange,
          ),
        ),
      ),
    );
  }
}
