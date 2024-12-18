import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_home_screen/core/resource/api_response.dart';
import 'package:weather_home_screen/core/resource/constants.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/entity_weather_data.dart';

part 'weather_api_services.g.dart';

@RestApi(baseUrl: weatherServerBaseURL)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @POST("weatherInternal/byLatLong")
  Future<HttpResponse<ApiResponse<EntityWeatherData>>> getWeatherByLatLong(
      @Body() Map<String, dynamic> map);
}
