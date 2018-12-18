import 'package:flutter/material.dart';

MaterialColor loudAppColor = MaterialColor(
  hexToInt("FFb5bf83"),
  <int, Color>{
    50: Color(hexToInt("FFf6f7f0")),
    100: Color(hexToInt("FFe9ecda")),
    200: Color(hexToInt("FFdadfc1")),
    300: Color(hexToInt("FFcbd2a8")),
    400: Color(hexToInt("FFc0c996")),
    500: Color(hexToInt("FFb5bf83")),
    600: Color(hexToInt("FFaeb97b")),
    700: Color(hexToInt("FFa5b170")),
    800: Color(hexToInt("FF9da966")),
    900: Color(hexToInt("FF8d9b53")),
  },
);

Color darkAppColor = Color(hexToInt('FF253235'));


// Color color=new Color(hexToInt("FFB74093"));
int hexToInt(String hex)
{
  int val = 0;
  int len = hex.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = hex.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("Invalid hexadecimal value");
    }
  }
  print(val);
  return val;
}