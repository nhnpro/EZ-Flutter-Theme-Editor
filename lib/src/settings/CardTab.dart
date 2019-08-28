import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';
import 'package:test_web/src/bloc/GlobalBloc.dart';
import 'package:test_web/src/widgets/ColorTextField.dart';

class CardTab extends StatefulWidget {
  @override
  _CardTabState createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  final cardColorController = TextEditingController();
  final cardElevationController = TextEditingController();
  final cardMarginController = TextEditingController();
  String clipBehaviorValue = "none";

  void updateTheme() {
    ThemeData themeData = GlobalConfiguration().get("themeData");
    if (themeData == null) {
      themeData = Theme.of(context);
    }
    Color cardColor = themeData.cardColor;
    double cardElevation = themeData.cardTheme.elevation;
    EdgeInsetsGeometry cardMargin = themeData.cardTheme.margin;
    ShapeBorder cardShape = themeData.cardTheme.shape;
    Clip clipBehavior = themeData.cardTheme.clipBehavior;
    if (StringUtils.isNotNullOrEmpty(cardColorController.text)) {
      cardColor = Color(ColorUtils.hexToInt(cardColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(cardElevationController.text)) {
      cardElevation = double.parse(cardElevationController.text);
    }
    if (StringUtils.isNotNullOrEmpty(cardMarginController.text)) {
      cardMargin = EdgeInsets.all(double.parse(cardMarginController.text));
    }
    switch (clipBehaviorValue) {
      case "none":
        clipBehavior = Clip.none;
        break;
      case "antiAliasWithSaveLayer":
        clipBehavior = Clip.antiAliasWithSaveLayer;
        break;
      case "antiAlias":
        clipBehavior = Clip.antiAlias;
        break;
      case "hardEdge":
        clipBehavior = Clip.hardEdge;
        break;
    }

    CardTheme cardTheme = CardTheme(
        elevation: cardElevation,
        shape: cardShape,
        clipBehavior: clipBehavior,
        margin: cardMargin);
    ThemeData data = themeData.copyWith(cardTheme: cardTheme, cardColor: cardColor);
    BlocProvider.of<GlobalBloc>(context).themeUpdateBloc.addition.add(data);
  }

  @override
  void initState() {
    super.initState();
    ThemeData themeData = GlobalConfiguration().get("themeData");
    if (themeData != null) {
      cardColorController.text =
          "#" + themeData.cardColor.value.toRadixString(16).substring(2).toUpperCase();
      cardElevationController.text = themeData.cardTheme.elevation.toString();
      cardMarginController.text = themeData.cardTheme.margin.toString();
    } else {
      cardColorController.text = "#FFFFFF";
      cardElevationController.text = "4";
      cardMarginController.text = "8";
    }
    cardColorController.addListener(updateTheme);
    cardElevationController.addListener(updateTheme);
    cardMarginController.addListener(updateTheme);
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
              Expanded(flex: 2, child: Text("Card Color:")),
              Expanded(flex: 3, child: ColorTextField(cardColorController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Card Elevation:")),
              Expanded(flex: 3, child: ColorTextField(cardElevationController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Card Margin:")),
              Expanded(flex: 3, child: ColorTextField(cardMarginController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Clipbehavior:")),
              Expanded(
                flex: 3,
                child: DropdownButton<String>(
                  value: clipBehaviorValue,
                  onChanged: (String value) {
                    setState(() {
                      this.clipBehaviorValue = value;
                      updateTheme();
                    });
                  },
                  items: <String>[
                    'none',
                    'antiAliasWithSaveLayer',
                    'antiAlias',
                    'hardEdge'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
