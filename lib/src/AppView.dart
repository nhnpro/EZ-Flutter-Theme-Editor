import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      child: Container(
        width: 360,
        height: 640,
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("AppBar"),
            ),
            Card(
              child: Container(
                height: 300,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Card Title",
                          style: Theme.of(context).textTheme.title,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Divider(),
                        ),
                        Text(
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              child: Text("Active"),
                              onPressed: () {},
                            ),
                            RaisedButton(
                                child: Text("Disabled"), onPressed: null)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            BottomAppBar(
              child: Container(
                height: 60,
                child: Center(
                  child: Text("BottomAppBar"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
