import 'package:flutter/material.dart';

class EzAppBarThemeData {
  Brightness brightness;
  Color color;
  double elevation;
  IconThemeData actionsIconTheme;
  IconThemeData iconTheme;
  TextTheme textTheme;

  EzAppBarThemeData({
    this.brightness,
    this.color,
    this.elevation,
    this.actionsIconTheme,
    this.iconTheme,
    this.textTheme,
  });

  AppBarTheme toAppBarTheme() {
    return AppBarTheme(
      color: color,
      elevation: elevation,
      brightness: brightness,
      actionsIconTheme: actionsIconTheme,
      iconTheme: iconTheme,
      textTheme: textTheme,
    );
  }
}
