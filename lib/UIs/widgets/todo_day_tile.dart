import 'package:flutter/material.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/text_custom.dart';

class TodoDayTile extends StatelessWidget {
  const TodoDayTile({
    super.key,
    required this.locations,
    required this.approxBudget,
    required this.weather,
  });

  final String locations;
  final String approxBudget;
  final String weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconWithText(
          text: locations,
          icon: Icons.location_on_outlined,
        ),
        IconWithText(
          text: approxBudget,
          icon: Icons.attach_money_outlined,
        ),
        IconWithText(
          text: weather,
          icon: Icons.wb_sunny_outlined,
        ),
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorsTravelMate.primary,
        ),
        Expanded(
          child: TextCustom(
            text: this.text,
            color: ColorsTravelMate.primary,
            fontSize: 15,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}