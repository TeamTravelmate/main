import 'package:flutter/material.dart';
import '../screens/home/feedView_page.dart';
import '../themes/colors.dart';

// ignore: camel_case_types
class feedCard extends StatelessWidget {
  const feedCard({
    super.key,
    required this.profile,
    required this.title,
    this.subtitleIcon = Icons.location_on_rounded,
    required this.subtitle,
    required this.post,
    required this.imagePath,
    required this.likes,
    required this.comments,
  });

  final String profile;
  final String title;
  final IconData subtitleIcon;
  final String subtitle;
  final String post;
  final String imagePath;
  final String likes;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => feed()),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                leading: FloatingActionButton.small(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => profile(),
                      //   ),
                      // );
                    },
                    backgroundColor: ColorsTravelMate.secundary,
                    child: Image.asset(profile)),
                title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Row(
                  children: [
                    Icon(subtitleIcon, size: 20),
                    Text(subtitle,
                        style:
                            const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))
                  ],
                ),
                trailing: const Icon(
                  Icons.more_horiz,
                  color: ColorsTravelMate.primary,
                  size: 30,
                ),
              ),
              Text(post),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Image.asset(imagePath),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.thumb_up_off_alt,
                        color: Colors.grey,
                      ),
                      Text(
                        likes,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.message_outlined,
                        color: Colors.grey,
                      ),
                      Text(
                        comments,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.telegram_outlined,
                        color: Colors.grey,
                      ),
                      Text(
                        '26',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}