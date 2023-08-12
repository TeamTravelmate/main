import 'package:flutter/material.dart';

class AppBarTitleWithIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextStyle? textStyle;

  const AppBarTitleWithIcon({super.key, required this.icon, required this.title, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: textStyle ?? const TextStyle(),
          ),
        ],
      ),
    );
  }
}