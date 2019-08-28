import 'dart:async';

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:rxdart/rxdart.dart';

import 'BlocProvider.dart';

class ThemeUpdateBloc implements BlocBase {
  static const String TAG = "ThemeUpdateBloc";

  /// Sinks
  Sink<ThemeData> get addition => itemAdditionController.sink;
  final itemAdditionController = StreamController<ThemeData>();

  /// Streams
  Stream<ThemeData> get stream => _cart.stream;
  final _cart = BehaviorSubject<ThemeData>();

  ThemeUpdateBloc() {
    itemAdditionController.stream.listen(handleThemeUpdate);
  }

  ///
  /// Logic for product added to shopping cart.
  ///
  void handleThemeUpdate(ThemeData theme) {
    if(GlobalConfiguration().get("themeData") == null){
      GlobalConfiguration().add({"themeData" : theme});
    }else{
      GlobalConfiguration().setValue("themeData", theme);
    }
    _cart.add(theme);
    return;
  }

  @override
  void dispose() {
    itemAdditionController.close();
  }
}
