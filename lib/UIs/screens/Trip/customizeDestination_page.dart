import 'package:flutter/material.dart';
import '../../themes/colors.dart';

class CustomizeDestination extends StatelessWidget {
  const CustomizeDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places Nearby'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsTravelMate.secundary,
                        foregroundColor: ColorsTravelMate.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'All',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 132, 201, 209),
                        foregroundColor: ColorsTravelMate.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Beaches',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 132, 201, 209),
                        foregroundColor: ColorsTravelMate.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Jungles',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 132, 201, 209),
                        foregroundColor: ColorsTravelMate.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Cities',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CardWidget(
                height: 30,
                width: 30,
                imagePath: 'assets/galleFort.png',
                titleText: Text(
                  '\n Dutch Fort',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitleText: Text(
                  'Galle, Sri Lanka \n',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(height: 5),
              const CardWidget(
                height: 30,
                width: 30,
                imagePath: 'assets/unawatuna.png',
                titleText: Text(
                  '\n Unawatuna Beach',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitleText: Text(
                  'Galle, Sri Lanka \n',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(height: 5),
              const CardWidget(
                height: 30,
                width: 30,
                imagePath: 'assets/jungleBeach.png',
                titleText: Text(
                  '\n Jungle Beach',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitleText: Text(
                  'Galle, Sri Lanka \n',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(height: 5),
              const CardWidget(
                height: 30,
                width: 30,
                imagePath: 'assets/galleFort.png',
                titleText: Text(
                  '\n Dutch Fort',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitleText: Text(
                  'Galle, Sri Lanka \n',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.titleText,
    required this.subtitleText,
  });

  final double height;
  final double width;
  final String imagePath;
  final Text titleText;
  final Text subtitleText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: SizedBox(
              child: Image(
                image: AssetImage(imagePath),
                height: 300,
                width: 200,
                alignment: Alignment.topLeft,
                centerSlice: const Rect.fromLTRB(0, 0, 0, 0),
              ),
            ),
            title: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: height,
                          width: width,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: ColorsTravelMate.tertiary,
                            child:
                                const Icon(Icons.favorite, color: Colors.red),
                          ),
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          height: height,
                          width: width,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: ColorsTravelMate.tertiary,
                            child: const Icon(
                              Icons.map_sharp,
                              color: ColorsTravelMate.secundary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          height: height,
                          width: width,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: ColorsTravelMate.tertiary,
                            child: const Icon(
                              Icons.add,
                              color: ColorsTravelMate.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    titleText,
                  ],
                )),
            subtitle: subtitleText,
          ),
        ],
      ),
    );
  }
}
