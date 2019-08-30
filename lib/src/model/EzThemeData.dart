import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:test_web/src/ThemeUtils.dart';
import 'package:test_web/src/model/EzButtonThemeData.dart';
import 'package:test_web/src/model/EzCardThemeData.dart';
import 'package:test_web/src/model/EzEdgeInsets.dart';
import 'package:test_web/src/model/EzIconThemeData.dart';

import 'EzAppBarThemeData.dart';
import 'EzColor.dart';

class EzThemeData {
  EzColor primaryColor;
  EzColor scaffoldBackgroundColor;
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
      primaryColor: primaryColor.toColor() ?? Colors.blue,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor.toColor() ?? Colors.grey[50],
      cardTheme:
          cardThemeData.toCardTheme() ?? ThemeUtils.getDefaultLightCardTheme(),
      buttonColor: buttonThemeData.buttonColor.toColor() ??
          Color(ColorUtils.hexToInt("#E0E0E0")),
      focusColor: buttonThemeData.focusColor.toColor() ??
          Color(ColorUtils.hexToInt("#E0E0E0")),
      highlightColor: buttonThemeData.highlightColor.toColor() ??
          Color(ColorUtils.hexToInt("#999999")),
      hoverColor: buttonThemeData.hoverColor.toColor() ??
          Color(ColorUtils.hexToInt("#F5F5F5")),
      splashColor: buttonThemeData.splashColor.toColor() ??
          Color(ColorUtils.hexToInt("#999999")),
      disabledColor: buttonThemeData.disabledColor.toColor() ??
          Color(ColorUtils.hexToInt("#9E9E9E")),
    );
  }

  EzThemeData.fromThemeData(ThemeData themeData) {
    this.primaryColor = EzColor.fromColor(themeData.primaryColor);
    this.scaffoldBackgroundColor =
        EzColor.fromColor(themeData.scaffoldBackgroundColor);
    this.buttonThemeData = EzButtonThemeData(
      buttonColor: EzColor.fromColor(themeData.buttonColor),
      disabledColor: EzColor.fromColor(themeData.disabledColor),
      focusColor: EzColor.fromColor(themeData.focusColor),
      highlightColor: EzColor.fromColor(themeData.highlightColor),
      hoverColor: EzColor.fromColor(themeData.hoverColor),
      splashColor: EzColor.fromColor(themeData.splashColor),
    );
    this.cardThemeData = EzCardThemeData(
      clipBehavior: themeData.cardTheme.clipBehavior,
      color: EzColor.fromColor(themeData.cardTheme.color),
      elevation: themeData.cardTheme.elevation,
      margin: EzEdgeInsets.fromEdgeInsets(themeData.cardTheme.margin),
      shape: themeData.cardTheme.shape,
    );
    this.appBarTheme = EzAppBarThemeData(
      actionsIconTheme: EzIconThemeData.fromIconThemeData(
          themeData.appBarTheme.actionsIconTheme),
      brightness: themeData.appBarTheme.brightness,
      color: EzColor.fromColor(themeData.appBarTheme.color),
      elevation: themeData.appBarTheme.elevation,
      iconTheme:
          EzIconThemeData.fromIconThemeData(themeData.appBarTheme.iconTheme),
      //textTheme: themeData.appBarTheme.textTheme,
    );
  }
}
