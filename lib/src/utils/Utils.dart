import 'dart:ui';

class Utils {
  static Color stringToColor(String c) {
    if (c.startsWith("#")) {
      c = c.replaceFirst("#", "FF");
      int color = int.parse(c, radix: 16);
      return Color(color);
    } else {
      int color = int.parse(c, radix: 16);
      return Color(color);
    }
  }
}
