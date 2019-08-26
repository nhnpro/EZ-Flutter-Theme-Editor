import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorTextField extends StatelessWidget {
  ColorTextField(this.controller);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(8),
      ),
      style: Theme.of(context).textTheme.body1,
      controller: controller,
    );
  }
}
