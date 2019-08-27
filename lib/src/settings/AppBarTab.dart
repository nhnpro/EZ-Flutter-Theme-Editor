import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';
import 'package:test_web/src/bloc/GlobalBloc.dart';
import 'package:test_web/src/widgets/ColorTextField.dart';

class AppBarTab extends StatefulWidget {
  @override
  _AppBarTabState createState() => _AppBarTabState();
}

class _AppBarTabState extends State<AppBarTab> {
  final appbarColorController = TextEditingController();
  final appbarElevationController = TextEditingController();
  String dropdownValue = "light";

  void updateTheme() {
    Color appbarColor = Theme.of(context).appBarTheme.color;
    double appbarElevation = Theme.of(context).appBarTheme.elevation;
    Brightness appbarBrightness = Theme.of(context).appBarTheme.brightness;
    TextTheme appbarTextTheme = Theme.of(context).appBarTheme.textTheme;
    IconThemeData appbarIconTheme = Theme.of(context).appBarTheme.iconTheme;
    IconThemeData appbarActionIconsTheme =
        Theme.of(context).appBarTheme.actionsIconTheme;
    if (StringUtils.isNotNullOrEmpty(appbarColorController.text)) {
      appbarColor = Color(ColorUtils.hexToInt(appbarColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(appbarElevationController.text)) {
      appbarElevation = double.parse(appbarElevationController.text);
    }
    if (dropdownValue == "light") {
      appbarBrightness = Brightness.light;
    } else {
      appbarBrightness = Brightness.dark;
    }

    AppBarTheme appbarTheme = AppBarTheme(
        color: appbarColor,
        brightness: appbarBrightness,
        elevation: appbarElevation,
        textTheme: appbarTextTheme,
        iconTheme: appbarIconTheme,
        actionsIconTheme: appbarActionIconsTheme);
    ThemeData data = Theme.of(context).copyWith(appBarTheme: appbarTheme);
    BlocProvider.of<GlobalBloc>(context).themeUpdateBloc.sink.add(data);
  }

  @override
  void initState() {
    super.initState();
    appbarColorController.addListener(updateTheme);
    appbarElevationController.addListener(updateTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("AppBar Color:")),
              Expanded(flex: 3, child: ColorTextField(appbarColorController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("AppBar Elevation:")),
              Expanded(
                  flex: 3, child: ColorTextField(appbarElevationController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("AppBar Brightness:")),
              Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String value) {
                      setState(() {
                        this.dropdownValue = value;
                        updateTheme();
                      });
                    },
                    items: <String>['light', 'dark']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
