import 'package:weather_home_screen/core/resource/data_state.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/entity_weather_data.dart';

abstract class GetWeatherBylatlongRepo {
  Future<DataState<EntityWeatherData>> getWeatherByLatLong(Map<String, dynamic> request);
}
