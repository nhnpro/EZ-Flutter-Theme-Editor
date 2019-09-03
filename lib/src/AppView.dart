import 'package:basic_utils/basic_utils.dart';
import 'package:ez_flutter/ez_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';

import 'bloc/GlobalBloc.dart';

class AppView extends StatefulWidget {
  AppView();

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  EzThemeData themeData = GlobalConfiguration().get("themeData");

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GlobalBloc>(context)
        .themeUpdateBloc
        .stream
        .listen((dynamic data) {
      if (data != null) {
        setState(() {
          themeData = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData.toThemeData(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          width: 376,
          height: 656,
          child: Center(
            child: Container(
              color: themeData.scaffoldBackgroundColor.toColor(),
              width: 360,
              height: 640,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 24,
                    color: getStatusBarColor(themeData.toThemeData()),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4, left: 16, bottom: 4),
                          child: Text(
                            "11:00",
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppBar(title: Text("AppBar")),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Title",
                          style: themeData.toThemeData().textTheme.title),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 300,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Card Title",
                                style: themeData.toThemeData().textTheme.title,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(),
                              ),
                              Text(
                                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RaisedButton(
                                    child: Text("Active"),
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                      child: Text("Disabled"), onPressed: null)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  BottomAppBar(
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Text("BottomAppBar"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getStatusBarColor(ThemeData themeData) {
    Color appBarColor = themeData.appBarTheme.color;
    if (appBarColor == null) {
      appBarColor = themeData.primaryColor;
    }
    String hex = appBarColor.value.toRadixString(16);
    hex = hex.substring(2);
    String shaded = ColorUtils.shadeColor(hex, -32);
    return Color(ColorUtils.hexToInt(shaded));
  }
}
