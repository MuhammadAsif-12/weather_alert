import 'package:weather_home_screen/features/home_page/domain/entities/entity_weather_data.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/locality_entity.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/location_entity.dart';

class ByLatLongModel extends EntityWeatherData {
  factory ByLatLongModel.fromJson(Map<String, dynamic> json) {
    EntityLocation? locationObj;

    var entityLocalityJson = json["locality"] ?? {};

    var entityLocality = EntityLocality(
        city: entityLocalityJson["city"] ?? "",
        address: entityLocalityJson["address"] ?? "");

    if (json.containsKey("nowcast")) {
      var jsonNowcast = json["nowcast"] ?? {};

      locationObj = EntityLocation(
        locationTitle: entityLocality.city ?? "",
        locAddress: entityLocality.address ?? "",
        temp: jsonNowcast["temp"].toString(),
        highTemp: jsonNowcast["maxTemp"].toString(),
        lowTemp: jsonNowcast["minTemo"].toString(),
        feelsLike: jsonNowcast["feelsLike"].toString(),
      );

      return ByLatLongModel(
        locationObj: locationObj,
      );
    } else {
      return ByLatLongModel();
    }
  }
  ByLatLongModel({super.locationObj});
}
