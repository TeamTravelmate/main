import 'package:flutter/material.dart';
import 'package:main/UIs/widgets/side_drawer.dart';
import '../../themes/colors.dart';
import '../../widgets/feed_widget.dart';

// ignore: camel_case_types
class feed extends StatelessWidget {
  const feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post'),
          backgroundColor: ColorsTravelMate.tertiary,
          foregroundColor: ColorsTravelMate.primary,
        ),
        body: const Column(
          children: [
            feedCard(
              profile: 'assets/profile.png',
              title: 'Nimesh Jayasinha',
              subtitle: 'Colombo, Sri Lanka',
              post: 'Can anyone recommend some place to travel on weekens???',
              imagePath: 'assets/post.png',
              likes: '100',
              comments: '12',
            ),
          ],
        ));
  }
}
