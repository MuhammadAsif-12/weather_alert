import 'package:weather_home_screen/core/resource/data_state.dart';
import 'package:weather_home_screen/features/home_page/data/api_service/data_source/weather_api_services.dart';
import 'package:weather_home_screen/features/home_page/data/models/by_lat_long_model.dart';
import 'package:weather_home_screen/features/home_page/domain/repository/weather_bylatlong_repo.dart';

class GetWeatherBylatlongRepoImpl implements GetWeatherBylatlongRepo {

  final WeatherApiService _weatherApiService;
  DataState dio;

  GetWeatherBylatlongRepoImpl(this._weatherApiService, this.dio);

 @override
  Future<DataState<ByLatLongModel>> getWeatherByLatLong(
      Map<String, dynamic> request) async {
    try {
      final httpResponse =
          await _weatherApiService.getWeatherByLatLong(request);
      var data = httpResponse.data;
      var response = httpResponse.response;
      if (response.statusCode == 200) {
        return DataSuccess(
            (data.record != null)
                ? ByLatLongModel.fromJson(data.record!)
                : null,
            data.msg,
            data.success);
      } else {
        throw Exception(response.toString());
      }
    } catch (e) {
      if (e is Exception) {
        print(e.toString());
        return DataException(e);
      } else {
        return DataException(Exception((e as Error).stackTrace.toString()));
      }
    }
  }
}

