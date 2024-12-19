import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/entity_weather_data.dart';

part 'by_lat_long_state.g.dart';

@CopyWith()
@immutable
class ByLatLongState extends Equatable {
  final List<EntityWeatherData> locationsList;

 const ByLatLongState({required this.locationsList});

  @override
  List<Object?> get props => [locationsList];
}
