import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';
import 'package:test_web/src/bloc/GlobalBloc.dart';
import 'package:test_web/src/model/EzColor.dart';
import 'package:test_web/src/model/EzThemeData.dart';
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
    EzThemeData themeData = GlobalConfiguration().get("themeData");
    EzColor primaryColor = themeData.primaryColor;
    EzColor scaffoldBackgroundColor = themeData.scaffoldBackgroundColor;
    //Color dividerColor = themeData.dividerColor;
    if (StringUtils.isNotNullOrEmpty(primaryColorController.text)) {
      primaryColor = EzColor(primaryColorController.text);
    }
    if (StringUtils.isNotNullOrEmpty(scaffoldColorController.text)) {
      scaffoldBackgroundColor = EzColor(scaffoldColorController.text);
    }
    //if (StringUtils.isNotNullOrEmpty(dividerColorController.text)) {
    //  dividerColor = Color(ColorUtils.hexToInt(dividerColorController.text));
    //}
    themeData.primaryColor = primaryColor;
    themeData.scaffoldBackgroundColor = scaffoldBackgroundColor;
    BlocProvider.of<GlobalBloc>(context)
        .themeUpdateBloc
        .addition
        .add(themeData);
  }

  @override
  void initState() {
    super.initState();
    EzThemeData themeData = GlobalConfiguration().get("themeData");

    primaryColorController.text = themeData.primaryColor.hex;
    scaffoldColorController.text = themeData.scaffoldBackgroundColor.hex;
    //dividerColorController.text = "#" +
    //    themeData.dividerTheme.color.value
    //        .toRadixString(16)
    //        .substring(2)
    //        .toUpperCase();
    dividerColorController.text = "";
    primaryColorController.addListener(updateTheme);
    scaffoldColorController.addListener(updateTheme);
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
