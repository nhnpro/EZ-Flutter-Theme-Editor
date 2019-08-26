import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  void updateTheme() {
    Color primaryColor = Theme.of(context).primaryColor;
    Color scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    if (StringUtils.isNotNullOrEmpty(primaryColorController.text)) {
      primaryColor = Color(ColorUtils.hexToInt(primaryColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(scaffoldColorController.text)) {
      scaffoldBackgroundColor =
          Color(ColorUtils.hexToInt(scaffoldColorController.text));
    }
    ThemeData data = Theme.of(context).copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor);
    BlocProvider.of<GlobalBloc>(context).themeUpdateBloc.sink.add(data);
  }

    @override
  void initState() {
    super.initState();
    primaryColorController.addListener(updateTheme);
    scaffoldColorController.addListener(updateTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text("Primary Color:")),
              Expanded(flex: 3, child: ColorTextField(primaryColorController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text("Scaffold Background Color:")),
              Expanded(flex: 3, child: ColorTextField(scaffoldColorController))
            ],
          ),
        ),
      ],
    );
  }
}
