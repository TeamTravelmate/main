//make a stateless widget

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:main/Data/env/apiKeys.dart';
import 'package:main/Domain/models/budget.dart';
import 'package:main/Domain/models/expense_model.dart';
import 'package:main/Domain/provider/budget_provider.dart';
import 'package:main/Domain/provider/trip_provider.dart';
import 'package:main/UIs/themes/colors.dart';

class AddStartingPlace extends StatelessWidget {
  //it takes the build context
  final BuildContext context;
  const AddStartingPlace({required this.context});

  @override
  Widget build(context) {
    return Consumer(
      builder: (context, ref, child) {
        return IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                final formKey = GlobalKey<FormState>();
                String startPlace = '';
                TextEditingController startPlaceController =
                    TextEditingController();
                @override
                void dispose() {
                  startPlaceController.dispose();
                }

                return Form(
                  key: formKey,
                  child: AlertDialog(
                    title: const Text('Add Starting Location'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GooglePlaceAutoCompleteTextField(
                          textEditingController: startPlaceController,
                          googleAPIKey: mapApi,
                          countries: ["LK"],
                          inputDecoration: const InputDecoration(
                            hintText: "Starting Location",
                            prefixIcon: Icon(Icons.location_on),
                          ),
                          boxDecoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          itemClick: (Prediction prediction) {
                            startPlaceController.text = prediction.description!;
                          },
                          isLatLngRequired: false,
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          final trip = ref.read(tripPlanningNotifierProvider);
                          ref
                              .read(tripPlanningNotifierProvider.notifier)
                              .updateTrip(
                                trip.value!.copyWith(
                                  startPlace: startPlaceController.text,
                                ),
                              );
                          Navigator.pop(context);
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              ColorsTravelMate.secundary),
                          foregroundColor: MaterialStatePropertyAll(
                              ColorsTravelMate.tertiary),
                        ),
                        child: const Text('Add'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              ColorsTravelMate.tertiary),
                          foregroundColor: MaterialStatePropertyAll(
                              ColorsTravelMate.secundary),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
