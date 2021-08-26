import 'dart:ui';

import 'package:flutter/material.dart';

abstract class CommonColor {
  static Color colorBlack = Color(0xFF122641);
  static Color colorGrey = Color(0xFF838383);
  static Color colorBlue = Color(0xFF3967D5);
  static Color colorBluePastel = Color(0xFFA1BAF6);
  static Color colorViolet = Color(0xFF990099);
}

class CommonTextStyle {
  static FontWeight light = FontWeight.w300;
  static FontWeight medium = FontWeight.w400;
  static FontWeight bold = FontWeight.w700;

  static TextStyle size12Light = TextStyle(
    fontSize: 12,
    fontWeight: light,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size12Medium = TextStyle(
    fontSize: 12,
    fontWeight: medium,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size12Bold = TextStyle(
    fontSize: 12,
    fontWeight: bold,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size14Light = TextStyle(
    fontSize: 14,
    fontWeight: light,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size14Medium = TextStyle(
    fontSize: 14,
    fontWeight: medium,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size14Bold = TextStyle(
    fontSize: 14,
    fontWeight: bold,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size16Light = TextStyle(
    fontSize: 16,
    fontWeight: light,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size16Medium = TextStyle(
    fontSize: 16,
    fontWeight: medium,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size16Mediumblur = TextStyle(
    fontSize: 16,
    fontWeight: medium,
    color: CommonColor.colorGrey.withOpacity(0.8),
    decoration: TextDecoration.none,
  );

  static TextStyle size16Bold = TextStyle(
    fontSize: 16,
    fontWeight: bold,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size18Light = TextStyle(
    fontSize: 18,
    fontWeight: light,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size18Medium = TextStyle(
    fontSize: 18,
    fontWeight: medium,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size18Bold = TextStyle(
    fontSize: 18,
    fontWeight: bold,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size20Light = TextStyle(
    fontSize: 20,
    fontWeight: light,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size20Medium = TextStyle(
    fontSize: 20,
    fontWeight: medium,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );

  static TextStyle size20Bold = TextStyle(
    fontSize: 20,
    fontWeight: bold,
    color: CommonColor.colorBlack,
    decoration: TextDecoration.none,
  );
}

class MaterialColors {
  const MaterialColors();

  static const _primaryColor = 0xFF2C56B9;

  static const MaterialColor colorLight = const MaterialColor(
    _primaryColor,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFDDDEDF),
      200: const Color(0xFFC7C7C7),
      300: const Color(0xFFECEFF9),
      400: const Color(0xFF838383),
      500: const Color(0xFFD9702D),
      600: const Color(0xFF2C56B9),
      700: const Color(0xFF2C2E31),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );
}
