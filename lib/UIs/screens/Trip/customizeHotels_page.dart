import 'package:flutter/material.dart';
import '../../../Domain/services/booking_hotels.dart';
import '../../themes/colors.dart';

class CustomizeHotels extends StatefulWidget {
  const CustomizeHotels({super.key});

  @override
  State<CustomizeHotels> createState() => _CustomizeHotelsState();
}

class _CustomizeHotelsState extends State<CustomizeHotels> {
  // Create a list to store retrieved hotels
  late Future<List<Hotel>> _hotels;

  @override
  void initState() {
    super.initState();
    _hotels = BookingService.getHotels('London');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lodging'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: FutureBuilder<List<Hotel>>(
        future: _hotels,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred'));
          } else {
            final hotels = snapshot.data!;
            return ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                // Get the hotel at the current index.
                final hotel = hotels[index];

                // Return a ListTile widget.
                return ListTile(
                  title: Text(hotel.name),
                  subtitle: Text(hotel.price.toString()),
                  leading: Image.network(hotel.imageUrl),
                );
              },
            );
          }
        },
      ),
    );
  }
}