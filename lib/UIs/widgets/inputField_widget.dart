import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    });
    final String labelText;
    final String hintText;
    final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixIcon,
          ),
        );
  }
}
