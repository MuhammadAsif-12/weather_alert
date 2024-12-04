import 'package:equatable/equatable.dart';

class EntityLocation extends Equatable {
  String? locAddress;
  String? locationTitle;
  String? temp;
  String? highTemp;
  String? lowTemp;
  String? feelsLike;

  EntityLocation({
     this.locAddress,
     this.locationTitle,
     this.temp,
     this.highTemp,
     this.lowTemp,
     this.feelsLike
    
  });

  @override
  List<Object?> get props => [
        locAddress,
        locationTitle,
        temp,
        highTemp,
        lowTemp,
        feelsLike
      ];
}
