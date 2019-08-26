import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';

import 'bloc/GlobalBloc.dart';

class AppView extends StatefulWidget {
  AppView();

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  ThemeData themeData;

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
          print(themeData.buttonColor);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (themeData == null) {
      themeData = Theme.of(context);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      child: Container(
        width: 360,
        height: 640,
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: themeData.appBarTheme.color,
              brightness: themeData.appBarTheme.brightness,
              elevation: themeData.appBarTheme.elevation,
              title: Text("AppBar"),
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
                          style: Theme.of(context).textTheme.title,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Divider(),
                        ),
                        Text(
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              color: themeData.buttonColor,
                              hoverColor: themeData.hoverColor,
                              disabledColor: themeData.disabledColor,
                              highlightColor: themeData.highlightColor,
                              focusColor: themeData.focusColor,
                              splashColor: themeData.splashColor,
                              child: Text("Active"),
                              onPressed: () {},
                            ),
                            RaisedButton(
                                color: themeData.buttonColor,
                                hoverColor: themeData.hoverColor,
                                disabledColor: themeData.disabledColor,
                                highlightColor: themeData.highlightColor,
                                focusColor: themeData.focusColor,
                                splashColor: themeData.splashColor,
                                child: Text("Disabled"),
                                onPressed: null)
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
    );
  }
}
