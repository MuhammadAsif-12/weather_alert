import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/location_entity.dart';

@CopyWith()
class EntityWeatherData extends Equatable {
  EntityLocation? locationObj;

  EntityWeatherData({
    this.locationObj
  });

  @override
  List<Object?> get props => [
       locationObj
      ];
}
