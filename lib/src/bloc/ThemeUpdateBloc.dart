import 'dart:async';

import 'package:flutter/material.dart';

import 'BlocProvider.dart';

class ThemeUpdateBloc implements BlocBase {
  static const String TAG = "ThemeUpdateBloc";

  final themeController = StreamController<ThemeData>();

  /// Sinks
  Sink<ThemeData> get sink => themeController.sink;

  /// Streams
  Stream<ThemeData> get stream => themeController.stream;

  ShoppingCartBloc() {
    themeController.stream.listen(handleThemeUpdate);
  }

  ///
  /// Logic for product added to shopping cart.
  ///
  void handleThemeUpdate(ThemeData theme) {
    sink.add(theme);
    return;
  }

  @override
  void dispose() {
    themeController.close();
  }
}
