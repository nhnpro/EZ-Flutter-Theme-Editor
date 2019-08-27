import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    Color cardColor = Theme.of(context).cardColor;
    double cardElevation = Theme.of(context).cardTheme.elevation;
    EdgeInsetsGeometry cardMargin = Theme.of(context).cardTheme.margin;
    ShapeBorder cardShape = Theme.of(context).cardTheme.shape;
    Clip clipBehavior = Theme.of(context).cardTheme.clipBehavior;
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
        color: cardColor,
        elevation: cardElevation,
        shape: cardShape,
        clipBehavior: clipBehavior,
        margin: cardMargin);
    ThemeData data = Theme.of(context).copyWith(cardTheme: cardTheme);
    BlocProvider.of<GlobalBloc>(context).themeUpdateBloc.sink.add(data);
  }

  @override
  void initState() {
    super.initState();
    cardColorController.text = "#FFFFFF";
    cardColorController.addListener(updateTheme);
    cardElevationController.text = "4";
    cardElevationController.addListener(updateTheme);
    cardMarginController.text = "4";
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
