
import 'package:flutter/material.dart';

enum AppTheme{
  Light,
  Dark,
}

String enumName(AppTheme anyEnum) => anyEnum.toString().split('.').last;

final appThemeData = {
  AppTheme.Light : ThemeData(),
  AppTheme.Dark : ThemeData(),
};