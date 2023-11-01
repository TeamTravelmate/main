import 'dart:async';

import 'package:main/Domain/models/itinerary.dart';
import 'package:main/Domain/provider/trip_provider.dart';
import 'package:main/Domain/provider/user_auth_provider.dart';
import 'package:main/Domain/services/itinerary_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'itinerary_provider.g.dart';

@Riverpod(keepAlive: true)
class ItineraryNotifier extends _$ItineraryNotifier{
  @override
  Future<Itinerary> build() {
    final token = ref.watch(userAuthNotifierProvider);
    final trip = ref.read(tripPlanningNotifierProvider);
    final service = ItineraryServices();
    return token.when(data: (token) {
      return service.getItinerary(trip.value!.tripId, token);
    }, error: (error, stackTrac) {
      return Future.error(
        Exception('Please login to view your itinerary'),
      );
    }, loading: () {
      Completer<Itinerary> completer = Completer<Itinerary>();
      return completer.future;
    });
  }

  Future<void> createItinerary(ItineraryElements element) async{
    final token = ref.read(userAuthNotifierProvider);
    final trip = ref.read(tripPlanningNotifierProvider);
    final service = ItineraryServices();
    state = AsyncValue.loading();
    await service.addItinerary(trip.value!.tripId!, element, token.value!);
    ref.invalidateSelf();
  }

  Future<void> updateItinerary(Itinerary updatedItinerary) async{
    //i have to individually add each additional element
    final token = ref.read(userAuthNotifierProvider);
    final trip = ref.read(tripPlanningNotifierProvider);
    final service = ItineraryServices();
    //get the length of the current itinerary
    final int currentLength = state.value!.itineraryElements!.length;
    state = AsyncValue.loading();
    for(int i = currentLength; i<updatedItinerary.itineraryElements!.length; i++){
      await service.addItinerary(trip.value!.tripId!, updatedItinerary.itineraryElements![i], token.value!);
    }
    state = AsyncValue.data(updatedItinerary);
  }
}