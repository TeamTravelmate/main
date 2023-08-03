import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/activityCard_widget.dart';
import '../../widgets/inputField_widget.dart';

class CustomizeActivities extends StatelessWidget {
  const CustomizeActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recreational Activities'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldWidget(
                  labelText: 'Search Activities',
                  hintText: 'Eg: Surfing, Camping',
                  prefixIcon: Icon(
                    Icons.surfing,
                    color: ColorsTravelMate.primary,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                'You haven\'\ t added any activities yet',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              ActivityCard(
                title: 'Surfing',
                icon: Icon(Icons.surfing),
                locationTitle: 'Unawatuna Beach',
                time: 'Duration: 2 - 3 Hours',
                age: 'Ages: 16 - 70',
                price: '1 Adult x \$50',
              ),
              SizedBox(
                height: 10,
              ),
              ActivityCard(
                title: 'Village cycling',
                icon: Icon(Icons.bike_scooter),
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
                icon: Icon(Icons.car_repair),
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
