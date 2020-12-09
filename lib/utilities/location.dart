import 'package:geolocator/geolocator.dart';

class Location {
  static const double latitudeKiev = 50.434341;
  static const double longitudeKiev = 30.527756;

  double latitude = latitudeKiev;
  double longitude = longitudeKiev;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Something goes wrong with location: $e');
    }
  }
}
