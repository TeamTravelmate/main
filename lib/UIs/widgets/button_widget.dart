import 'package:flutter/material.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/textCustom.dart';

class buttonWidget extends StatelessWidget {
  const buttonWidget({
    super.key,
    required this.width,
    this.onPressed,
    this.height = 50,
    this.border = 8.0,
    this.fontSize = 20,
    this.backgroundColor = ColorsTravelMate.primary,
    this.textColor = ColorsTravelMate.tertiary,
    required this.labelText,
    required this.path,
  });

  final double width;
  final double height;
  final double border;
  final double fontSize;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String labelText;
  final path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border))),
        child:
            TextCustom(text: labelText, color: textColor, fontSize: fontSize),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => path),
          );
        },
      ),
    );
  }
}
