import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityAppBar extends StatelessWidget {
  const ActivityAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      expandedHeight: 200,
      leading: Padding(
        padding: EdgeInsets.only(left: 16),
        child: CircleAvatar(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
