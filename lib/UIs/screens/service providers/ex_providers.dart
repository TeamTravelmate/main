import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../profile/profile.dart';

class ExperienceProviders extends StatefulWidget {
  const ExperienceProviders({Key? key}) : super(key: key);

  @override
  State<ExperienceProviders> createState() => _ExperienceProvidersState();
}

class _ExperienceProvidersState extends State<ExperienceProviders> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience Providers'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Providerlist(
                imagePath: 'assets/img/man.jpg',
                name: 'Hasantha Kariyawasam',
              ),
              SizedBox(
                height: 10,
              ),
              Providerlist(
                imagePath: 'assets/img/man.jpg',
                name: 'Luqman Fazal',
              ),
              SizedBox(
                height: 10,
              ),
              Providerlist(
                imagePath: 'assets/img/woman.jpg',
                name: 'Usha Perera',
              ),
              SizedBox(
                height: 10,
              ),
              Providerlist(
                imagePath: 'assets/img/woman2.jpg',
                name: 'Gagana Samarasekara',
              ),
              SizedBox(
                height: 10,
              ),
              Providerlist(
                imagePath: 'assets/img/girl.webp',
                name: 'Buddhi Prabodha',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Providerlist extends StatelessWidget {
  const Providerlist({
    super.key,
    required this.imagePath,
    required this.name,
  });

  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Profile(),
        //   ),
        // );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
