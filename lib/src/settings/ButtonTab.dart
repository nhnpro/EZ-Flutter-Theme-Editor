import 'package:basic_utils/basic_utils.dart';
import 'package:ez_flutter/ez_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';
import 'package:test_web/src/bloc/GlobalBloc.dart';
import 'package:test_web/src/widgets/ColorTextField.dart';

class ButtonTab extends StatefulWidget {
  @override
  _ButtonTabState createState() => _ButtonTabState();
}

class _ButtonTabState extends State<ButtonTab> {
  final btnColorController = TextEditingController();
  final btnDisabledColorController = TextEditingController();
  final btnHoverColorController = TextEditingController();
  final btnFocusColorController = TextEditingController();
  final btnSplashColorController = TextEditingController();
  final btnHighlightColorController = TextEditingController();

  void updateTheme() {
    EzThemeData themeData = GlobalConfiguration().get("themeData");
    EzColor btnColor = themeData.buttonThemeData.buttonColor;
    EzColor btnDisabledColor = themeData.buttonThemeData.disabledColor;
    EzColor btnHoverColor = themeData.buttonThemeData.hoverColor;
    EzColor btnFocusColor = themeData.buttonThemeData.focusColor;
    EzColor btnSplashColor = themeData.buttonThemeData.splashColor;
    EzColor btnHighlightColor = themeData.buttonThemeData.highlightColor;
    if (StringUtils.isNotNullOrEmpty(btnColorController.text)) {
      btnColor = EzColor(btnColorController.text);
    }
    if (StringUtils.isNotNullOrEmpty(btnDisabledColorController.text)) {
      btnDisabledColor = EzColor(btnDisabledColorController.text);
    }
    if (StringUtils.isNotNullOrEmpty(btnHoverColorController.text)) {
      btnHoverColor = EzColor(btnHoverColorController.text);
    }
    if (StringUtils.isNotNullOrEmpty(btnFocusColorController.text)) {
      btnFocusColor = EzColor(btnFocusColorController.text);
    }
    if (StringUtils.isNotNullOrEmpty(btnSplashColorController.text)) {
      btnSplashColor = EzColor(btnSplashColorController.text);
    }
    if (StringUtils.isNotNullOrEmpty(btnHighlightColorController.text)) {
      btnHighlightColor = EzColor(btnHighlightColorController.text);
    }

    EzButtonThemeData btnThemeData = EzButtonThemeData(
      buttonColor: btnColor,
      disabledColor: btnDisabledColor,
      hoverColor: btnHoverColor,
      focusColor: btnFocusColor,
      splashColor: btnSplashColor,
      highlightColor: btnHighlightColor,
    );
    themeData.buttonThemeData = btnThemeData;
    BlocProvider.of<GlobalBloc>(context)
        .themeUpdateBloc
        .addition
        .add(themeData);
  }

  @override
  void initState() {
    super.initState();
    EzThemeData themeData = GlobalConfiguration().get("themeData");

    btnColorController.text = themeData.buttonThemeData.buttonColor.hex;
    btnHighlightColorController.text =
        themeData.buttonThemeData.highlightColor.hex;
    btnDisabledColorController.text =
        themeData.buttonThemeData.disabledColor.hex;
    btnHoverColorController.text = themeData.buttonThemeData.hoverColor.hex;
    btnFocusColorController.text = themeData.buttonThemeData.focusColor.hex;
    btnSplashColorController.text = themeData.buttonThemeData.splashColor.hex;

    btnColorController.addListener(updateTheme);
    btnDisabledColorController.addListener(updateTheme);
    btnHoverColorController.addListener(updateTheme);
    btnFocusColorController.addListener(updateTheme);
    btnSplashColorController.addListener(updateTheme);
    btnHighlightColorController.addListener(updateTheme);
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
              Expanded(flex: 2, child: Text("Button Color:")),
              Expanded(flex: 3, child: ColorTextField(btnColorController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Disabled Color:")),
              Expanded(
                  flex: 3, child: ColorTextField(btnDisabledColorController))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Hover Color:")),
              Expanded(
                flex: 3,
                child: ColorTextField(btnHoverColorController),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Focus Color:")),
              Expanded(
                flex: 3,
                child: ColorTextField(btnFocusColorController),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Splash Color:")),
              Expanded(
                flex: 3,
                child: ColorTextField(btnSplashColorController),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Text("Highlight Color:")),
              Expanded(
                flex: 3,
                child: ColorTextField(btnHighlightColorController),
              )
            ],
          ),
        )
      ],
    );
  }
}
