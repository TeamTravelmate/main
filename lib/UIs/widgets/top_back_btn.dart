import 'package:flutter/material.dart';
import 'package:main/UIs/themes/colors.dart';

class TopBackBtn extends StatelessWidget {
  const TopBackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 20,
      left: MediaQuery.of(context).size.width / 20,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          //back button that is filled
          icon: Stack(
            children: [
              Positioned(child: Container(
                decoration: BoxDecoration(
                  color: ColorsTravelMate.tertiary,
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 20),
                ),
              ),),
              Center(
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    size: MediaQuery.of(context).size.width / 15,
                    color: ColorsTravelMate.primary),
              ),
            ],
          )),
    );
  }
}