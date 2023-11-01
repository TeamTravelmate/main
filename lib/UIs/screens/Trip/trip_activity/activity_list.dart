import 'package:flutter/material.dart';
import 'package:main/Domain/models/Trip/activity_package_model.dart';
import 'package:main/Domain/models/Trip/activity_package_model.dart';

import '../../../../Domain/models/Trip/activity_package_model.dart';
import '../../../../Domain/models/Trip/activity_package_model.dart';
import '../../../../Domain/models/Trip/activity_package_model.dart';

class ActivityList extends StatelessWidget {
  const ActivityList(this.selected, this.callback, this.activityPackage,
      {super.key});

  final int selected;
  final Function callback;
  final ActivityPackage activityPackage;

  @override
  Widget build(BuildContext context) {
    final category = activityPackage.menu.keys.toList();
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  callback(index);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color:
                        selected == index ? Colors.blueGrey[100] : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category[index],
                    style: TextStyle(
                        color: selected == index
                            ? Colors.blueGrey[900]
                            : Colors.blueGrey[500],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(width: 20),
          itemCount: category.length),
    );
  }
}
