import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:test_web/src/ThemeUtils.dart';
import 'package:test_web/src/model/EzButtonThemeData.dart';
import 'package:test_web/src/model/EzCardThemeData.dart';

import 'EzAppBarThemeData.dart';

class EzThemeData {
  Color primaryColor;
  Color scaffoldBackgroundColor;
  EzCardThemeData cardThemeData;
  EzButtonThemeData buttonThemeData;
  EzAppBarThemeData appBarTheme;

  EzThemeData({
    this.primaryColor,
    this.scaffoldBackgroundColor,
    this.cardThemeData,
    this.buttonThemeData,
  });

  ThemeData toThemeData() {
    return ThemeData(
      primaryColor: primaryColor ?? Colors.blue,
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? Colors.grey[50],
      cardTheme:
          cardThemeData.toCardTheme() ?? ThemeUtils.getDefaultLightCardTheme(),
      buttonColor:
          buttonThemeData.buttonColor ?? Color(ColorUtils.hexToInt("#E0E0E0")),
      focusColor:
          buttonThemeData.focusColor ?? Color(ColorUtils.hexToInt("#E0E0E0")),
      highlightColor: buttonThemeData.highlightColor ??
          Color(ColorUtils.hexToInt("#999999")),
      hoverColor:
          buttonThemeData.hoverColor ?? Color(ColorUtils.hexToInt("#F5F5F5")),
      splashColor:
          buttonThemeData.splashColor ?? Color(ColorUtils.hexToInt("#999999")),
      disabledColor: buttonThemeData.disabledColor ??
          Color(ColorUtils.hexToInt("#9E9E9E")),
    );
  }

  EzThemeData.fromThemeData(ThemeData themeData) {
    this.primaryColor = themeData.primaryColor;
    this.scaffoldBackgroundColor = themeData.scaffoldBackgroundColor;
    this.buttonThemeData = EzButtonThemeData(
      buttonColor: themeData.buttonColor,
      disabledColor: themeData.disabledColor,
      focusColor: themeData.focusColor,
      highlightColor: themeData.highlightColor,
      hoverColor: themeData.hoverColor,
      splashColor: themeData.splashColor,
    );
    this.cardThemeData = EzCardThemeData(
      clipBehavior: themeData.cardTheme.clipBehavior,
      color: themeData.cardTheme.color,
      elevation: themeData.cardTheme.elevation,
      margin: themeData.cardTheme.margin,
      shape: themeData.cardTheme.shape,
    );
    this.appBarTheme = EzAppBarThemeData(
      actionsIconTheme: themeData.appBarTheme.actionsIconTheme,
      brightness: themeData.appBarTheme.brightness,
      color: themeData.appBarTheme.color,
      elevation: themeData.appBarTheme.elevation,
      iconTheme: themeData.appBarTheme.iconTheme,
      textTheme: themeData.appBarTheme.textTheme,
    );
  }
}
