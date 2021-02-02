//////////////////////////////////////////////////////////////////////////////////////////////////////////
class KhCapacityUnit {
  double laEy;
  double kontang;
  double tao;

  void inputLaEy(double value) {
    kontang = 1 / 2;
    tao = 1 / 4;
  }

  void inputKontang(double value) {
    laEy = 2;
    tao = 1 / 2;
  }

  void inputTao(double value) {
    laEy = 4;
    kontang = 2;
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class KhWeightUnit {
  double hun;
  double li;
  double domlerng;
  double ji;
  double neal;
  double jong;
  double hab;
  Map<String, double> getAll() {
    return {
      "Li": li,
      "Hun": hun,
      "Domlerng": domlerng,
      "Ji": ji,
      "Neal": neal,
      "Jong": jong,
      "Hab": hab
    };
  }

  void inputHun(double value) {
    hun = value;
    li = hun * 10;
    ji = hun / 10;
    domlerng = ji / 10;
    neal = domlerng / 16;
    jong = neal / 50;
    hab = jong / 2;
  }

  void inputLi(double value) {
    li = value;
    hun = li / 10;
    ji = hun / 10;
    domlerng = ji / 10;
    neal = domlerng / 16;
    jong = neal / 50;
    hab = jong / 2;
  }

  void inputDomleng(double value) {
    domlerng = value;
    ji = domlerng * 10;
    hun = ji * 10;
    li = hun * 10;
    neal = domlerng / 16;
    jong = neal / 50;
    hab = jong / 2;
  }

  void inputJi(double value) {
    ji = value;
    hun = ji * 10;
    li = hun * 10;
    domlerng = ji / 10;
    neal = domlerng / 16;
    jong = neal / 50;
    hab = jong / 2;
  }

  void inputNeal(double value) {
    neal = value;
    domlerng = neal * 16;
    ji = domlerng * 10;
    hun = ji * 10;
    li = hun * 10;
    jong = neal / 50;
    hab = jong / 2;
  }

  void inputJong(double value) {
    jong = value;
    hab = jong / 2;
    neal = jong * 50;
    domlerng = neal * 16;
    ji = domlerng * 10;
    hun = ji * 10;
    li = hun * 10;
  }

  void inputHab(double value) {
    hab = value;
    jong = hab * 2;
    neal = jong * 50;
    domlerng = neal * 16;
    ji = domlerng * 10;
    hun = ji * 10;
    li = hun * 10;
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
class KhLengthUnit {
  double tneab;
  double jomArm;
  double hat;
  double pyeam;
  double sen;
  double keavut;
  double yoch;
  Map<String, double> getAll() {
    return {
      "Tneab": tneab,
      "JomArm": jomArm,
      "Hat": hat,
      "Pyeam": pyeam,
      "Sen": sen,
      "Keavut": keavut,
      "Yoch": yoch
    };
  }

  void inputTneab(double value) {
    tneab = value;
    jomArm = tneab / 12;
    hat = jomArm / 2;
    pyeam = hat / 4;
    sen = pyeam / 20;
    keavut = sen / 100;
    yoch = sen / 400;
  }

  void inputJomArm(double value) {
    jomArm = value;
    hat = jomArm / 2;
    pyeam = hat / 4;
    sen = pyeam / 20;
    keavut = sen / 100;
    yoch = sen / 400;
    tneab = 12 * jomArm;
  }

  void inputHat(double value) {
    hat = value;
    jomArm = hat * 2;
    tneab = jomArm * 12;
    pyeam = hat / 4;
    sen = pyeam / 20;
    keavut = sen / 100;
    yoch = sen / 400;
  }

  void inputPyeam(double value) {
    pyeam = value;
    hat = pyeam * 4;
    jomArm = 2 * hat;
    tneab = 12 * jomArm;
    sen = pyeam / 20;
    keavut = sen / 100;
    yoch = sen / 400;
  }

  void inputSen(double value) {
    sen = value;
    pyeam = sen * 20;
    hat = pyeam * 4;
    jomArm = hat * 2;
    tneab = jomArm * 12;
    keavut = sen / 100;
    yoch = sen / 400;
  }

  void inputKeavut(double value) {
    keavut = value;
    sen = keavut * 100;
    pyeam = sen * 20;
    hat = pyeam * 4;
    jomArm = hat * 2;
    tneab = jomArm * 12;
    yoch = sen / 400;
  }

  void inputYoch(double value) {
    yoch = value;
    sen = yoch * 400;
    pyeam = sen * 20;
    hat = pyeam * 4;
    jomArm = hat * 2;
    tneab = jomArm * 12;
    keavut = sen / 100;
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class KhFruitUnit {
  int plae;
  int ku;
  int dombor;
  int plon;
  int sleuk;

  void inputPlae(int value) {
    ku = 0;
    dombor = 0;
    plon = 0;
    sleuk = 0;
  }

  void inputKu(int value) {
    plae = 0;
    dombor = 0;
    plon = 0;
    sleuk = 0;
  }

  void inputDombor(int value) {
    plae = 0;
    ku = 0;
    plon = 0;
    sleuk = 0;
  }

  void inputPlon(int value) {
    plae = 0;
    ku = 0;
    dombor = 0;
    sleuk = 0;
  }

  void inputSleuk(int value) {
    plae = 0;
    ku = 0;
    dombor = 0;
    plon = 0;
  }
}
