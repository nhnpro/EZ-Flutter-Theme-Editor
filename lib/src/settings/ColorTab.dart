import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';
import 'package:test_web/src/bloc/GlobalBloc.dart';

class ColorTab extends StatefulWidget {
  @override
  _ColorTabState createState() => _ColorTabState();
}

class _ColorTabState extends State<ColorTab> {
  final primaryController = TextEditingController();

  void changeColor(Color color) => print("Color changed to $color");

  void updateTheme(BuildContext context, ThemeData data) {
    BlocProvider.of<GlobalBloc>(context).themeUpdateBloc.sink.add(data);
  }

  @override
  void initState() {
    super.initState();
    primaryController.addListener(_updatePrimaryColor);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Lorem Ipsum ..."),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Text("PrimaryColor:")),
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                style: Theme.of(context).textTheme.body1,
                onChanged: (text) {
                  text = text.replaceFirst("#", "FF");
                  int color = int.parse(text, radix: 16);
                  ThemeData data =
                      Theme.of(context).copyWith(primaryColor: Color(color));
                  updateTheme(context, data);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                child: Text("Color"),
                onPressed: () {},
              ),
            )
          ],
        )
      ],
    );
  }

  _updatePrimaryColor() {
    String c = primaryController.text.replaceFirst("#", "FF");
    int color = int.parse(c, radix: 16);
    ThemeData data = Theme.of(context).copyWith(primaryColor: Color(color));
    updateTheme(context, data);
  }
}
