// use https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
// for better visualization of the colors

import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class MagnifiColorPalette {
  const MagnifiColorPalette();

  static const Primary primary = Primary();
  static const Secondary secondary = Secondary();
  static const Functional functional = Functional();
  static const Utility utility = Utility();
  static const Charts charts = Charts();

  static final appBackgroundColor = primary.offWhite.v400;
}

class Charts {
  const Charts();

  final List<Color> pieChart = const [
    Color(0xff3959DE),
    Color(0xffDBE2FF),
    Color(0xffD08F2D),
    Color(0xffE1F27A),
    Color(0xffF4D3B4),
    Color(0xff7A6225),
  ];
}

class Primary {
  const Primary();

  final YellowGold yellowGold = const YellowGold();
  final Neutral neutral = const Neutral();
  final OffWhite offWhite = const OffWhite();
  final Bronze bronze = const Bronze();
  final LightBlue lightBlue = const LightBlue();
  final DarkBlue darkBlue = const DarkBlue();
  final LightGrey lightGrey = const LightGrey();
  final DarkGrey darkGrey = const DarkGrey();
}

class Secondary {
  const Secondary();

  final Color paleBlue = const Color(0xffDBE2FF);
  final Color paleLavender = const Color(0xffD4DCFB);
  final Color ochre = const Color(0xffD08F2D);
  final Color lime = const Color(0xffE1F27A);
  final Color indigoBlue = const Color(0xff3959DE);
  final Color indigo = const Color(0xffBDC8F4);
  final Color peach = const Color(0xffF4D3B4);
  final Color brass = const Color(0xff7A6225);
  final Color dataVizPink = const Color(0xffFAABAF);
  final Color dataVizRed = const Color(0xffEC5B5B);
  final Color dataVizMaroon = const Color(0xff79160A);
  final Color dataVizLightMaroon = const Color(0xffCF8A81);
  final Color dataVizTeal = const Color(0xff246967);
  final Color dataVizLightTeal = const Color(0xff88A7A6);
  final Color yellow = const Color(0xffFFDA56);
  final Color maroon = const Color(0xff79160A);
  final Color lilac = const Color(0xffAB95EA);
  final Color orange = const Color(0xffE26C15);
  final Color lightOrange = const Color(0xffFFDFC7);
  final Color green = const Color(0xff3D6905);
  final Color fairPink = const Color(0xffFFECEC);
  final Chart chart = const Chart();
}

class Functional {
  const Functional();

  final Danger danger = const Danger();
  final Info info = const Info();
  final Success success = const Success();
  final Warning warning = const Warning();
}

class YellowGold {
  const YellowGold();

  final Color v0 = const Color(0xffF9F5E3);
  final Color v50 = const Color(0xffF5EED0);
  final Color v100 = const Color(0xffEFE6B8);
  final Color v200 = const Color(0xffEADEA1);
  final Color v300 = const Color(0xffE5D589);
  final Color v400 = const Color(0xffE0CD72);
  final Color v500 = const Color(0xffBBAB5F);
  final Color v600 = const Color(0xff95894C);
  final Color v700 = const Color(0xff706739);
  final Color v800 = const Color(0xff4B4426);
  final Color v900 = const Color(0xff2D2917);
}

class Neutral {
  const Neutral();

  final Color v0 = const Color(0xffFFFFFF);
  final Color v25 = const Color(0xffFCFDFD);
  final Color v50 = const Color(0xffFAFAFA);
  final Color v100 = const Color(0xffF5F5F5);
  final Color v200 = const Color(0xffF0F0F0);
  final Color v300 = const Color(0xffDEDEDE);
  final Color v400 = const Color(0xffC2C2C2);
  final Color v500 = const Color(0xff979797);
  final Color v600 = const Color(0xff818181);
  final Color v700 = const Color(0xff606060);
  final Color v800 = const Color(0xff3C3C3C);
  final Color v900 = const Color(0xff000000);
}

class OffWhite {
  const OffWhite();

  final Color v0 = const Color(0xffFCFCFB);
  final Color v50 = const Color(0xffF9FAF8);
  final Color v100 = const Color(0xffF6F7F4);
  final Color v200 = const Color(0xffF4F4F0);
  final Color v300 = const Color(0xffF1F2ED);
  final Color v400 = const Color(0xffEEEFE9);
  final Color v500 = const Color(0xffC6C7C2);
  final Color v600 = const Color(0xff9F9F9B);
  final Color v700 = const Color(0xff777875);
  final Color v800 = const Color(0xff4F504E);
  final Color v900 = const Color(0xff30302F);
}

class Bronze {
  const Bronze();

  final Color v0 = const Color(0xffF3EDE4);
  final Color v50 = const Color(0xffEBE1D1);
  final Color v100 = const Color(0xffE0D2BA);
  final Color v200 = const Color(0xffD6C4A4);
  final Color v300 = const Color(0xffCCB58D);
  final Color v400 = const Color(0xffC6A46B);
  final Color v500 = const Color(0xffA28A62);
  final Color v600 = const Color(0xff816F4F);
  final Color v700 = const Color(0xff61533B);
  final Color v800 = const Color(0xff413727);
  final Color v900 = const Color(0xff272118);
}

class LightBlue {
  const LightBlue();

  final Color v0 = const Color(0xffF8F9FF);
  final Color v50 = const Color(0xffF3F5FF);
  final Color v100 = const Color(0xffEDF0FF);
  final Color v200 = const Color(0xffE7ECFF);
  final Color v300 = const Color(0xffE1E7FF);
  final Color v400 = const Color(0xffDBE2FF);
  final Color v500 = const Color(0xffB6BCD4);
  final Color v600 = const Color(0xff9297AA);
  final Color v700 = const Color(0xff6E7180);
  final Color v800 = const Color(0xff494B55);
  final Color v900 = const Color(0xff2C2D33);
}

class LightGrey {
  const LightGrey();

  final Color v0 = const Color(0xffE8E8E8);
  final Color v50 = const Color(0xffD9D9D9);
  final Color v100 = const Color(0xffC6C6C6);
  final Color v200 = const Color(0xffB4B4B4);
  final Color v300 = const Color(0xffA1A1A1);
  final Color v400 = const Color(0xff8E8E8E);
  final Color v500 = const Color(0xff767676);
  final Color v600 = const Color(0xff5F5F5F);
  final Color v700 = const Color(0xff474747);
  final Color v800 = const Color(0xff2F2F2F);
  final Color v900 = const Color(0xff1C1C1C);
}

class DarkGrey {
  const DarkGrey();

  final Color v0 = const Color(0xffD9D9D9);
  final Color v50 = const Color(0xffC0C0C0);
  final Color v100 = const Color(0xffA1A1A1);
  final Color v200 = const Color(0xff818181);
  final Color v300 = const Color(0xff626262);
  final Color v400 = const Color(0xff424242);
  final Color v500 = const Color(0xff373737);
  final Color v600 = const Color(0xff2C2C2C);
  final Color v700 = const Color(0xff212121);
  final Color v800 = const Color(0xff161616);
  final Color v900 = const Color(0xff0D0D0D);
}

class Danger {
  const Danger();

  final Color pressed = const Color(0xff890E0E);
  final Color main = const Color(0xffCD1515);
  final Color border = const Color(0xffE68A8A);
  final Color v300 = const Color(0xffD53C3C);
  final Color v0 = const Color(0xffF5D0D0);
  final Color v200 = const Color(0xffDE6363);
}

class Warning {
  const Warning();

  final Color v0 = const Color(0xffFFF5E6);
  final Color pressed = const Color(0xff653508);
  final Color main = const Color(0xffEA780E);
  final Color border = const Color(0xffFFCA99);
  final Color v40 = const Color(0xffB86E00);
  final Color v50 = const Color(0xffA66300);
  final Color surface = const Color(0xffFFF2E7);
}

class Success {
  const Success();

  final Color pressed = const Color(0xff2F7505);
  final Color main = const Color(0xff47B007);
  final Color border = const Color(0xffC2E5AC);
  final Color v0 = const Color(0xffDAEFCD);
  final Color surface = const Color(0xffEBF5F0);
}

class Info {
  const Info();

  final Color pressed = const Color(0xff043C8F);
  final Color main = const Color(0xff0B5CD7);
  final Color border = const Color(0xffB6CFF3);
  final Color v0 = const Color(0xffE6F6FF);
  final Color v10 = const Color(0xff2EA2E6);
  final Color v30 = const Color(0xff0071B3);
  final Color v50 = const Color(0xff005180);
}

class DarkBlue {
  const DarkBlue();

  final Color v900 = const Color(0xff011A43);
}

class Chart {
  const Chart();

  final Color darkRed = const Color(0xffBD2E0E);
  final Color lightRed = const Color(0xffFDCEC8);
  final Color darkGreen = const Color(0xff0E5225);
  final Color lightGreen = const Color(0xffD1E7D8);
}

class Utility {
  const Utility();

  final Color greenLight = const Color(0xff5DE05B);
  final Color greenDark = const Color(0xff18893E);
  final Color redLight = const Color(0xffFF5935);
  final Color redDark = const Color(0xffBD2E0E);
  final Color transparent = Colors.transparent;
  final Color magUpDark = const Color(0xff02772A);
}
