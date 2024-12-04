import 'package:weather_home_screen/core/resource/data_state.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/entity_weather_data.dart';

abstract class WeatherBylatlongRepo {
  Future<DataState<EntityWeatherData>> getWeatherByLatLong();
}
