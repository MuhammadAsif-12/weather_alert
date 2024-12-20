import 'package:weather_home_screen/features/home_page/domain/entities/locality_entity.dart';

abstract class EventByLatLong {
  EventByLatLong();
}

class EventFetchLocation extends EventByLatLong {}

class GetByLatLongEvent extends EventByLatLong {
  String lat;
  String long;
  GetByLatLongEvent({required this.lat, required this.long});

  @override
  List<Object?> get props => [lat, long];
}

class GetWeatherForLocation extends EventByLatLong {
  EntityLocality? locality;
  bool? isLocationEnable;
  int index;

  GetWeatherForLocation({this.isLocationEnable, required this.index});
}

class ByLatLngInitialEvent extends EventByLatLong {
  ByLatLngInitialEvent();
}