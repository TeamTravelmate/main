import 'package:main/Domain/provider/user_auth_provider.dart';
import 'package:main/Domain/services/trip_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../Data/env/env.dart';
import 'package:main/Domain/models/trip.dart';

part 'my_trips_provider.g.dart';

@riverpod
Future<List<Trip>> myTrips(MyTripsRef ref) async {
  final token = ref.watch(userAuthNotifierProvider);
  final service = TripServices();
  final tokenValue = token.when(
    data: (token) => token,
    loading: () => '',
    error: (error, stackTrace) => '',
  );
  //something
  return service.getMyTrips(tokenValue);
}