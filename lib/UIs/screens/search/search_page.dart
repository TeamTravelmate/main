import 'package:flutter/material.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/textCustom.dart';

class SearchPlace extends StatelessWidget {
  const SearchPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          foregroundColor: ColorsTravelMate.primary,
          backgroundColor: ColorsTravelMate.tertiary,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: SizedBox(
            height: 50,
            width: 300,
            child: TextField(
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            const TextCustom(
              text: 'Suggestions for you',
              fontWeight: FontWeight.bold,
              color: ColorsTravelMate.primary,
            ),
            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  PlaceCard(
                    imagePath: 'assets/unawatuna beach.jpg',
                    title: 'Unawatuna Beach',
                    subtitle: 'Galle, Sri Lanka',
                  ),
                  PlaceCard(
                    imagePath: 'assets/jungle beach.jpg',
                    title: 'Jungle Beach',
                    subtitle: 'Galle, Sri Lanka',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key,
  required this.imagePath,
  required this.title,
  required this.subtitle,
  });

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: 300,
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: 300,
            ),
            ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: const Icon(Icons.favorite, color: Colors.red, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
