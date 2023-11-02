import 'package:main/Domain/provider/trip_provider.dart';
import 'package:main/Domain/services/place_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

part 'mapCoordinates_provider.g.dart';

@riverpod
class MapCoordinatesNotifier extends _$MapCoordinatesNotifier {
  @override
  Future<List<Map<String, dynamic>>> build() {
    //intially just return the coordinates of the destination
    final trip = ref.read(tripPlanningNotifierProvider);
    final geoCoderService = PlaceServices();
    return geoCoderService.getLatLngFromAddresses([trip.value!.destination!]);
  }

  Future<void> newCoordinates(List<String> addresses) async {
    final geocoderService = PlaceServices();
    state = AsyncValue.loading();
    final List<Map<String, dynamic>> newCoordinates =
        await geocoderService.getLatLngFromAddresses(addresses);
    state = AsyncValue.data(newCoordinates);
  }
}