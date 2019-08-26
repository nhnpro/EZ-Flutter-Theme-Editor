import 'package:flutter/material.dart';
import 'package:test_web/src/AppView.dart';
import 'package:test_web/src/SettingsTabBar.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';
import 'package:test_web/src/bloc/GlobalBloc.dart';
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
      body: Row(
        children: [
          AppView(),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  SettingsTabBar(),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ColorTab(),
                        ButtonTab(),
                        CardTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
