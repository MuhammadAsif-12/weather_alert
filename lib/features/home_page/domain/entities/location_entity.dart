import 'package:equatable/equatable.dart';

class EntityLocation extends Equatable {
 final String? locAddress;
 final String? locationTitle;
 final String? temp;
 final String? highTemp;
 final String? lowTemp;
 final String? feelsLike;

const  EntityLocation({
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
