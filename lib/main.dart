import 'package:flutter/material.dart';
import 'package:test_web/src/AppView.dart';
import 'package:test_web/src/SettingsBar.dart';
import 'package:test_web/src/SettingsTabBar.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';
import 'package:test_web/src/bloc/GlobalBloc.dart';
import 'package:test_web/src/settings/AppBarTab.dart';
import 'package:test_web/src/settings/ButtonTab.dart';
import 'package:test_web/src/settings/CardTab.dart';
import 'package:test_web/src/settings/ColorTab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlobalBloc>(
      bloc: GlobalBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {"/home": (context) => null},
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 60,
            decoration: BoxDecoration(color: Colors.pink, boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
            ]),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 1140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ez Theme Editor",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontSize: 40),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: Row(
                        children: [
                          AppView(),
                          Expanded(
                            child: DefaultTabController(
                              length: 4,
                              child: Column(
                                children: [
                                  SettingsBar(),
                                  SettingsTabBar(),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        ColorTab(),
                                        ButtonTab(),
                                        CardTab(),
                                        AppBarTab(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
