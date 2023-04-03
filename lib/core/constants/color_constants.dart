import 'package:flutter/material.dart';

class ColorConstants {
  static final ColorConstants _instance = ColorConstants._init();
  static ColorConstants get instance => ColorConstants._instance;

  // Colors are named with https://chir.ag/projects/name-that-color/

  Color blueRibbon = const Color(0xFF006AFF);
  Color thunder = const Color(0xFF3A3335);
  Color tundora = const Color(0xFF484848);
  Color gray = const Color(0xFF908E8E);
  Color white = const Color(0xFFFFFFFF);
  Color ebb = const Color(0xFFEDE8E9);
  Color zumthor = const Color(0xFFE5EDFF);

  ColorConstants._init();
}
