import 'package:geolocator/geolocator.dart';

class Location {
  double lat, lon;

  Future<void> getloc() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
