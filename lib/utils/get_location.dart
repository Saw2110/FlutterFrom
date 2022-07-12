import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

// Future<void> getAddressFromLatLong(Position position) async {
//   List<Placemark> placemarks =
//       await placemarkFromCoordinates(position.latitude, position.longitude);
//   CustomLog.successLog(value:placemarks);
//   Placemark place = placemarks[0];
//   Address =
//       '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
//   setState(() {});
// }
}
