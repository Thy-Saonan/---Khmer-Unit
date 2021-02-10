import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/material.dart';
import 'package:calculator/input_box.dart';
import 'package:calculator/units.dart';
import 'package:hexcolor/hexcolor.dart';

var term = "length";
bool lengthSelected = true;
int selectedTerm = 0;
int selectedTheme = 3;
String selectedLanguage = 'kh';
var headerLabel = {
  'en': ["LENGTH", "WEIGHT", "ខ្មែរ", "DARK", "LIGHT"],
  'kh': ["ប្រវែង", "ទម្ងន់", "ENGLISH", "ងងឹត", "ភ្លឺ"],
};
Map<String, bool> kh = {'kh': true, 'en': false};
List<String> unitName = unitOfEachTerm[term];
var language = languageOfEachTerm[term];
var unitOfEachTerm = {
  "length": ["JomArm", "Hat", "Pyeam", "Sen", "Keavut", "Yoch", "Tneab"],
  "weight": ["Li", "Ji", "Domlerng", "Neal", "Jong", "Hab"],
};
var languageOfEachTerm = {
  "length": {
    "en": ["JomArm", "Hat", "Pyeam", "Sen", "Keavut", "Yoch", "Tneab"],
    "kh": ["ចំអាម", "ហត្ថ", "ព្យាម", "សិន", "គាវុត្ថ", "យោជន៍", "ធ្នាប"]
  },
  "weight": {
    "kh": ["លី", "ជី", "ដំឡឹង", "នាល", "ចុង", "ហាប"],
    "en": ["Li", "Ji", "Domlerng", "Neal", "Jong", "Hab"]
  },
};
var darkColors = {
  false: {
    "background": "EFEEEE",
    "lowerShadow": "#D1CDC7",
    "upperShadow": "#FFFFFF",
    "textColor": "#000000",
    "labelColor": "#999999"
  },
  true: {
    "background": "#26282b",
    "lowerShadow": "#1f2123",
    "upperShadow": "#2d2e33",
    "textColor": "#d9d9d9",
    "labelColor": "#d9d9d9"
  }
};

// ignore: must_be_immutable
class UnitBox extends StatelessWidget {
  String value;
  String label;
  UnitBox(this.label, this.value) {
    this.value = value;
  }
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              label,
              style: TextStyle(
                color: HexColor(darkColors[darkTheme]["labelColor"]),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: this.value,
                style: TextStyle(
                  color: HexColor(darkColors[darkTheme]["textColor"]),
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class LengthUnitPage extends StatelessWidget {
  var klu = new KhLengthUnit();
  var kwu = new KhWeightUnit();
  final GlobalKey _lKey;
  final getHeight;
  final tapInputBox;
  final onThemeChange;
  double heighth;
  String inputValue = '';
  double boxSize = 0;
  Map<String, double> convertedValue;
  PageController _boxController = PageController(
    initialPage: 0,
  );

  var darkTheme;
  var selectedLanguage;
  var term;
  final onLanguageChange;
  final onTermChange;
  LengthUnitPage(
    this._lKey,
    this.getHeight,
    this.inputValue,
    this.darkTheme,
    this.selectedLanguage,
    this.term,
    this.tapInputBox,
    this.onThemeChange,
    this.onLanguageChange,
    this.onTermChange,
  ) {
    darkTheme = this.darkTheme;
    term = this.term;
    selectedLanguage = this.selectedLanguage;
    if (darkTheme) {
      selectedTheme = 3;
    } else {
      selectedTheme = 4;
    }
    if (term == "length") {
      lengthSelected = true;
      selectedTerm = 0;
      unitName = unitOfEachTerm[term];
      language = languageOfEachTerm[term];
      if (unitName[unitName.length - 1] == "JomArm") {
        klu.inputJomArm(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Hat") {
        klu.inputHat(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Pyeam") {
        klu.inputPyeam(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Sen") {
        klu.inputSen(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Keavut") {
        klu.inputKeavut(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Yoch") {
        klu.inputYoch(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Tneab") {
        klu.inputTneab(double.parse(inputValue));
      }
      this.convertedValue = klu.getAll();
    } else if (term == "weight") {
      lengthSelected = false;
      selectedTerm = 1;
      unitName = unitOfEachTerm[term];
      language = languageOfEachTerm[term];
      if (unitName[unitName.length - 1] == "Li") {
        kwu.inputLi(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Ji") {
        kwu.inputJi(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Domlerng") {
        kwu.inputDomleng(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Neal") {
        kwu.inputNeal(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Jong") {
        kwu.inputJong(double.parse(inputValue));
      } else if (unitName[unitName.length - 1] == "Hab") {
        kwu.inputHab(double.parse(inputValue));
      }
      this.convertedValue = kwu.getAll();
    }
  }
  void swapEndElement(eleIndex) {
    String temp = unitName[eleIndex];
    unitName[eleIndex] = unitName[unitName.length - 1];
    unitName[unitName.length - 1] = temp;

    temp = language[selectedLanguage][eleIndex];
    language[selectedLanguage][eleIndex] =
        language[selectedLanguage][unitName.length - 1];
    language[selectedLanguage][unitName.length - 1] = temp;
    _boxController.animateToPage(
      0,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    tapInputBox();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var variableSet = 0;
    Future<void> _showMyDialog(index) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // return on tap
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0,
            contentPadding: EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            content: Box(
              darkTheme,
              width: MediaQuery.of(context).size.width,
              child: UnitBox(language[selectedLanguage][index],
                  convertedValue[unitName[index]].toString()),
            ),
          );
        },
      );
    }

    //list of input box
    List<Widget> input = [
      Container(
        key: _lKey,
        child: Box(
          darkTheme,
          height: 0.15 * height,
          width: width,
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 30, left: 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: Text(
                      language[selectedLanguage][unitName.length - 1],
                      style: TextStyle(
                        color: HexColor(darkColors[darkTheme]["labelColor"]),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      inputValue,
                      style: TextStyle(
                        fontSize: 42,
                        color: HexColor(darkColors[darkTheme]["textColor"]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        height: 0.15 * height,
        padding: EdgeInsets.only(left: 10),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 2.5 / 1),
          itemBuilder: (context, pos) {
            return GestureDetector(
              onTap: () {
                swapEndElement(pos);
              },
              child: Box(
                darkTheme,
                child: Text(language[selectedLanguage][pos],
                    style: TextStyle(
                      color: HexColor(darkColors[darkTheme]["textColor"]),
                    )),
              ),
            );
          },
          itemCount: unitName.length - 1,
        ),
      )
    ];
    Map<bool, BoxDecoration> switchShadow = {
      true: BoxDecoration(
        color: HexColor(darkColors[darkTheme]["background"]),
        boxShadow: [
          BoxShadow(
            color: HexColor(darkColors[darkTheme]["upperShadow"]),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(-4, -4),
          ),
          BoxShadow(
            color: HexColor(darkColors[darkTheme]["lowerShadow"]),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(4, 4),
          ),
        ],
      ),
      false: BoxDecoration(
        color: Colors.transparent,
      )
    };
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: ListView(
        children: [
          //Header Switch
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (darkTheme) {
                        selectedTheme = 4;
                        darkTheme = false;
                      } else {
                        selectedTheme = 3;
                        darkTheme = true;
                      }
                      onThemeChange(darkTheme);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: switchShadow[darkTheme],
                      child: Text(
                        headerLabel[selectedLanguage][selectedTheme],
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: HexColor(darkColors[darkTheme]["textColor"]),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (selectedLanguage == "kh")
                        selectedLanguage = "en";
                      else
                        selectedLanguage = "kh";
                      onLanguageChange(selectedLanguage);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: switchShadow[kh[selectedLanguage]],
                        child: Center(
                            child: Text(
                          headerLabel[selectedLanguage][2],
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: HexColor(darkColors[darkTheme]["textColor"]),
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (lengthSelected) {
                        term = "weight";
                        selectedTerm = 1;
                        lengthSelected = false;
                      } else {
                        term = "length";
                        selectedTerm = 0;
                        lengthSelected = true;
                      }
                      onTermChange(term);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: switchShadow[lengthSelected],
                      child: Text(
                        headerLabel[selectedLanguage][selectedTerm],
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: HexColor(darkColors[darkTheme]["textColor"]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //inputBox
          GestureDetector(
            onTap: () => tapInputBox(inputbox: true),
            child: Container(
              height: 0.15 * height,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: PageView(
                  scrollDirection: Axis.vertical,
                  controller: _boxController,
                  children: [input[0], input[1]],
                ),
              ),
            ),
          ),
          DragAndDropGridView(
            onWillAccept: (oldIndex, newIndex) => false,
            onReorder: (oldIndex, newIndex) {
              String temp = unitName[oldIndex];
              unitName[oldIndex] = unitName[newIndex];
              unitName[newIndex] = temp;
              temp = language[selectedLanguage][oldIndex];
              language[selectedLanguage][oldIndex] =
                  language[selectedLanguage][newIndex];
              language[selectedLanguage][newIndex] = temp;
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2 / 1),
            itemBuilder: (context, index) => LayoutBuilder(
              builder: (context, costrains) {
                if (variableSet == 0) {
                  height = costrains.maxHeight;
                  width = costrains.maxWidth;
                  variableSet++;
                  heighth = height;
                  getHeight(height);
                }
                return GridTile(
                  child: GestureDetector(
                    onTap: () => _showMyDialog(index),
                    child: Box(
                      darkTheme,
                      child: UnitBox(
                        language[selectedLanguage][index],
                        convertedValue[unitName[index]].toString(),
                      ),
                      height: height,
                      width: width,
                    ),
                  ),
                );
              },
            ),
            isCustomFeedback: true,
            feedback: (pos) => Box(
              darkTheme,
              width: MediaQuery.of(context).size.width / 2,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(language[selectedLanguage][pos],
                    style: TextStyle(
                        color: Colors.grey[400],
                        decoration: TextDecoration.none)),
              ),
            ),
            itemCount: unitName.length - 1,
          ),
        ],
      ),
    );
  }
}
