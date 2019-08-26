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

  void updateTheme() {
    Color cardColor = Theme.of(context).cardColor;
    double cardElevation = Theme.of(context).cardTheme.elevation;
    ShapeBorder cardShape = Theme.of(context).cardTheme.shape;
    if (StringUtils.isNotNullOrEmpty(cardColorController.text)) {
      cardColor = Color(ColorUtils.hexToInt(cardColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(cardElevationController.text)) {
      cardElevation = double.parse(cardElevationController.text);
    }

    CardTheme cardTheme = CardTheme(color: cardColor,elevation: cardElevation, shape: cardShape);
    ThemeData data = Theme.of(context).copyWith(
        cardTheme: cardTheme);
    BlocProvider.of<GlobalBloc>(context).themeUpdateBloc.sink.add(data);
  }

  @override
  void initState() {
    super.initState();
    cardColorController.addListener(updateTheme);
    cardElevationController.addListener(updateTheme);
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
              Expanded(flex: 1, child: Text("Card Color:")),
              Expanded(flex: 3, child: ColorTextField(cardColorController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text("Card Elevation:")),
              Expanded(flex: 3, child: ColorTextField(cardElevationController))
            ],
          ),
        ),
      ],
    );
  }
}
