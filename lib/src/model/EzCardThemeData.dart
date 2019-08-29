import 'package:flutter/material.dart';

class EzCardThemeData {
  Clip clipBehavior;
  Color color;
  double elevation;
  EdgeInsetsGeometry margin;
  ShapeBorder shape;

  EzCardThemeData(
      {this.clipBehavior, this.color, this.elevation, this.margin, this.shape});

  CardTheme toCardTheme() {
    return CardTheme(
      clipBehavior: clipBehavior,
      color: color,
      elevation: elevation,
      margin: margin,
      shape: shape,
    );
  }
}
