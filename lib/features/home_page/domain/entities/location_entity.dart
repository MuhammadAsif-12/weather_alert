import 'package:equatable/equatable.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/locality_entity.dart';

class EntityLocation extends Equatable {
  final String? locAddress;
  final String? locationTitle;
  final String? temp;
  final String? highTemp;
  final String? lowTemp;
  final String? feelsLike;
  final String? lat;
  final String? long;
  final EntityLocality? locality;
  bool? locationEnabled;

  EntityLocation(
      {this.locAddress,
      this.locationTitle,
      this.temp,
      this.highTemp,
      this.lowTemp,
      this.feelsLike,
      this.lat,
      this.long,
      this.locality,
      this.locationEnabled});

  @override
  List<Object?> get props => [
        locAddress,
        locationTitle,
        temp,
        highTemp,
        lowTemp,
        feelsLike,
        lat,
        long,
        locality,
        locationEnabled
      ];
}
