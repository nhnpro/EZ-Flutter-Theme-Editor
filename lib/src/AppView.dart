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
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Container(
        color: themeData.scaffoldBackgroundColor,
        width: 360,
        height: 640,
        child: Column(
          children: <Widget>[
            Container(
              height: 24,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 16, bottom: 4),
                    child: Text(
                      "11:00",
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            AppBar(
                backgroundColor: themeData.appBarTheme.color,
                brightness: themeData.appBarTheme.brightness,
                elevation: themeData.appBarTheme.elevation,
                textTheme: themeData.appBarTheme.textTheme,
                iconTheme: themeData.appBarTheme.iconTheme,
                actionsIconTheme: themeData.appBarTheme.actionsIconTheme,
                title: Text("AppBar")),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Title", style: Theme.of(context).textTheme.title),
              ),
            ),
            Card(
              color: themeData.cardTheme.color,
              elevation: themeData.cardTheme.elevation,
              shape: themeData.cardTheme.shape,
              clipBehavior: themeData.cardTheme.clipBehavior,
              margin: themeData.cardTheme.margin,
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
                          child: Divider(
                            color: themeData.dividerColor,
                          ),
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
