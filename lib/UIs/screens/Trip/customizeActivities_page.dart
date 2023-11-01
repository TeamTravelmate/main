import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/activityCard_widget.dart';
import '../../widgets/inputField_widget.dart';

class CustomizeActivities extends StatelessWidget {
  const CustomizeActivities({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recreational Activities'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'My Activities',
                style: TextStyle(
                    color: ColorsTravelMate.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'You haven\'\ t added any activities yet',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Popular Activities in Galle',
                style: TextStyle(
                    color: ColorsTravelMate.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                labelText: 'Search Activities',
                hintText: 'Eg: Surfing, Camping',
                prefixIcon: Icon(
                  Icons.surfing,
                  color: ColorsTravelMate.primary,
                ),
                validator: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              const ActivityCard(
                title: 'Surfing',
                // icon: Icon(Icons.surfing),
                packageName: 'Ahikava Surf School',
                imagepath: 'assets/hiking.jpeg',
                locationTitle: 'Unawatuna Beach',
                time: 'Duration: 2 - 3 Hourssss',
                age: 'Ages: 16 - 70',
                price: '1 Adult x \$50',
              ),
              const ActivityCard(
                title: '',
                // icon: Icon(Icons.surfing),
                packageName: 'Ahikava Surf School',
                imagepath: 'assets/hiking.jpeg',
                locationTitle: 'Unawatuna Beach',
                time: 'Duration: 2 - 3 Hourssss',
                age: 'Ages: 16 - 70',
                price: '1 Adult x \$50',
              ),
              SizedBox(
                height: 10,
              ),
              ActivityCard(
                title: 'Village cycling',
                // icon: Icon(Icons.bike_scooter),
                packageName: 'Ahikava Surf School',
                imagepath: 'assets/cycling.jpg',
                locationTitle: 'Unawatuna',
                time: 'Duration: 3 - 4 Hours',
                age: 'Ages: 7 - 70',
                price: '1 Adult x \$50',
              ),
              SizedBox(
                height: 10,
              ),
              ActivityCard(
                title: 'Safari',
                // icon: Icon(Icons.car_repair),
                packageName: 'Ahikava Surf School',
                imagepath: 'assets/safari.jpg',
                locationTitle: 'Yala',
                time: 'Duration: 8 - 10 Hours',
                age: 'Ages: 7 - 70',
                price: '1 Adult x \$50',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
