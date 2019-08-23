import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:test_web/src/colorPicker/block_picker.dart';
import 'package:test_web/src/colorPicker/flutter_colorpicker.dart';
import 'package:test_web/src/colorPicker/material_picker.dart';

class ColorTab extends StatelessWidget {
  Color currentColor = Colors.amber;

  void changeColor(Color color) => print("Color changed to $color");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Lorem Ipsum ..."),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PrimaryColor',
                ),
              ),
            ),
            FlatButton(
              child: Text("Color"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.all(0.0),
                      contentPadding: const EdgeInsets.all(0.0),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: currentColor,
                          onColorChanged: changeColor,
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        )
      ],
    );
  }
}
