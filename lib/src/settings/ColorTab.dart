import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';
import 'package:test_web/src/bloc/GlobalBloc.dart';
import 'package:test_web/src/widgets/ColorTextField.dart';

class ColorTab extends StatefulWidget {
  @override
  _ColorTabState createState() => _ColorTabState();
}

class _ColorTabState extends State<ColorTab> {
  final primaryController = TextEditingController();

  final primaryColorController = TextEditingController();
  final scaffoldColorController = TextEditingController();
  final dividerColorController = TextEditingController();

  void updateTheme() {
    ThemeData themeData = GlobalConfiguration().get("themeData");
    if (themeData == null) {
      themeData = Theme.of(context);
    }
    Color primaryColor = themeData.primaryColor;
    Color scaffoldBackgroundColor = themeData.scaffoldBackgroundColor;
    Color dividerColor = themeData.dividerColor;
    if (StringUtils.isNotNullOrEmpty(primaryColorController.text)) {
      primaryColor = Color(ColorUtils.hexToInt(primaryColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(scaffoldColorController.text)) {
      scaffoldBackgroundColor =
          Color(ColorUtils.hexToInt(scaffoldColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(dividerColorController.text)) {
      dividerColor = Color(ColorUtils.hexToInt(dividerColorController.text));
    }
    ThemeData data = themeData.copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        dividerColor: dividerColor);
    BlocProvider.of<GlobalBloc>(context).themeUpdateBloc.sink.add(data);
  }

  @override
  void initState() {
    super.initState();
    primaryColorController.text = "#42A5F5";
    primaryColorController.addListener(updateTheme);
    scaffoldColorController.text = "#FAFAFA";
    scaffoldColorController.addListener(updateTheme);
    dividerColorController.text = "#E0E0E0";
    dividerColorController.addListener(updateTheme);
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
              Expanded(flex: 2, child: Text("Primary Color:")),
              Expanded(flex: 3, child: ColorTextField(primaryColorController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Scaffold Background Color:")),
              Expanded(flex: 3, child: ColorTextField(scaffoldColorController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Divider Color:")),
              Expanded(flex: 3, child: ColorTextField(dividerColorController))
            ],
          ),
        ),
      ],
    );
  }
}
