import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AdIconType {
  iconData,
  svg,
}

class AdVariant extends StatelessWidget {
  final String adText;
  final TextStyle textStyle;
  final IconData? iconData;
  final String? iconSvg;
  final AdIconType iconType;

  AdVariant({
    required this.adText,
    required this.textStyle,
    this.iconData,
    this.iconSvg,
    this.iconType = AdIconType.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
    switch (iconType) {
      case AdIconType.iconData:
        iconWidget = Icon(iconData, size: 30);
        break;
      case AdIconType.svg:
        iconWidget = SvgPicture.asset(
          iconSvg!,
          width: 24,
          height: 24,
        );
        break;
    }

    return Container(
      width: 90,
      height: 97,
      decoration: ShapeDecoration(
        color: const Color(0xCCEFEFEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
              ),
              clipBehavior: Clip.antiAlias,
              child: Center(
                child: iconWidget,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              adText,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
