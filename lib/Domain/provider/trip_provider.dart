import 'dart:async';

import 'package:main/Domain/provider/user_auth_provider.dart';
import 'package:main/Domain/services/trip_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../Data/env/env.dart';
import 'package:main/Domain/models/trip.dart';

part 'trip_provider.g.dart';

@Riverpod(keepAlive: true)
class TripPlanningNotifier extends _$TripPlanningNotifier {
  @override
  Future<Trip> build() {
    final token = ref.watch(userAuthNotifierProvider);
    final service = TripServices();
    return token.when(data: (token) {
      return service.getTrip(token);
    }, error: (error, stackTrac) {
      return Future.error(
        Exception('Please login to view your trip'),
      );
    }, loading: () {
      Completer<Trip> completer = Completer<Trip>();
      return completer.future;
    });
  }

  Future<void> createTrip(Map<String, dynamic> trip) async {
    //get token
    final token = ref.watch(userAuthNotifierProvider);
    final service = TripServices();
    token.when(
      data: (token) async {
        state = const AsyncValue.loading();
        state = await AsyncValue.guard(() async {
          return service.createTrip(trip, token);
        });
      },
      loading: () {
        state = const AsyncValue.loading();
      },
      error: (error, stackTrace) {
        throw Exception('Please login to create a trip');
      },
    );
  }
}
