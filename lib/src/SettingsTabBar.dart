import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          child: Text(
            "Color",
            style:
                Theme.of(context).textTheme.body1.copyWith(color: Colors.black),
          ),
        ),
        Tab(
          child: Text("Button",
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black)),
        ),
        Tab(
          child: Text("Card",
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black)),
        ),
      ],
    );
  }
}
