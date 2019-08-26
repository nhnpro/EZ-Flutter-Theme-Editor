import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_web/src/bloc/BlocProvider.dart';
import 'package:test_web/src/bloc/GlobalBloc.dart';
import 'package:test_web/src/utils/Utils.dart';

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
    Color btnColor = Theme.of(context).buttonColor;
    Color btnDisabledColor = Theme.of(context).disabledColor;
    Color btnHoverColor = Theme.of(context).hoverColor;
    Color btnFocusColor = Theme.of(context).focusColor;
    Color btnSplashColor = Theme.of(context).splashColor;
    Color btnHighlightColor = Theme.of(context).highlightColor;
    if (StringUtils.isNotNullOrEmpty(btnColorController.text)) {
      btnColor = Utils.stringToColor(btnColorController.text);
    }
    if (StringUtils.isNotNullOrEmpty(btnDisabledColorController.text)) {
      btnDisabledColor =
          Color(ColorUtils.hexToInt(btnDisabledColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(btnHoverColorController.text)) {
      btnHoverColor = Color(ColorUtils.hexToInt(btnHoverColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(btnFocusColorController.text)) {
      btnFocusColor = Color(ColorUtils.hexToInt(btnFocusColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(btnSplashColorController.text)) {
      btnSplashColor =
          Color(ColorUtils.hexToInt(btnSplashColorController.text));
    }
    if (StringUtils.isNotNullOrEmpty(btnHighlightColorController.text)) {
      btnHighlightColor =
          Color(ColorUtils.hexToInt(btnHighlightColorController.text));
    }
    ThemeData data = Theme.of(context).copyWith(
        buttonColor: btnColor,
        disabledColor: btnDisabledColor,
        hoverColor: btnHoverColor,
        focusColor: btnFocusColor,
        splashColor: btnSplashColor,
        highlightColor: btnHighlightColor);
    BlocProvider.of<GlobalBloc>(context).themeUpdateBloc.sink.add(data);
  }

  @override
  void initState() {
    super.initState();
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Text("Button Color:")),
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                style: Theme.of(context).textTheme.body1,
                controller: btnColorController,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Text("Disabled Color:")),
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                style: Theme.of(context).textTheme.body1,
                controller: btnDisabledColorController,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Text("Hover Color:")),
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                style: Theme.of(context).textTheme.body1,
                controller: btnHoverColorController,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Text("Focus Color:")),
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                style: Theme.of(context).textTheme.body1,
                controller: btnFocusColorController,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Text("Splash Color:")),
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                style: Theme.of(context).textTheme.body1,
                controller: btnSplashColorController,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Text("Highlight Color:")),
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                style: Theme.of(context).textTheme.body1,
                controller: btnHighlightColorController,
              ),
            )
          ],
        )
      ],
    );
  }
}
