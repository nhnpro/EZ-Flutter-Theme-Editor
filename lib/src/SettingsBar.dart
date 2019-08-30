import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Settings",
              style: Theme.of(context).textTheme.title,
            ),
            RaisedButton(
              child: Text("Export Theme"),
              onPressed: () {
                HttpUtils.getForString("https://ez-flutter.de/api/redirect");
              },
            )
          ],
        ),
      ),
    );
  }
}
