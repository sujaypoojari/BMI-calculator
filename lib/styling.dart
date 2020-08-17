import 'package:flutter/material.dart';

Color profile = colorConvert("f20089");
Color customSlider = colorConvert("e500a4");
Color waColor = colorConvert("ff5400");
Color button = colorConvert("6a00f4");

Color colorConvert(String color) {
  color = color.replaceAll("#", "");
  var converted;
  if (color.length == 6) {
    converted = Color(int.parse("0xFF" + color));
  } else if (color.length == 8) {
    converted = Color(int.parse("0x" + color));
  }
  return converted;
}
