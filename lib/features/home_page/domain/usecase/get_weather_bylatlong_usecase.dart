import 'package:weather_home_screen/constant/usecase/usecase.dart';
import 'package:weather_home_screen/core/resource/data_state.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/entity_weather_data.dart';
import 'package:weather_home_screen/features/home_page/domain/repository/weather_bylatlong_repo.dart';

// Use Case
class GetWeatherByLatLongUseCase
    implements FutureUseCase<DataState<EntityWeatherData>, RequestByLatLong> {
  final GetWeatherBylatlongRepo _byLatLongRepo;

  GetWeatherByLatLongUseCase(this._byLatLongRepo);

  @override
  Future<DataState<EntityWeatherData>> call({RequestByLatLong? params}) {
    if (params == null) {
      throw ArgumentError('Request parameters cannot be null.');
    }
    return _byLatLongRepo.getWeatherByLatLong(params.toJson());
  }
}

// Request Object
class RequestByLatLong {
  final String lat;
  final String long;

  RequestByLatLong({required this.lat, required this.long});

  Map<String, dynamic?> toJson() {
    return {'lat': lat, 'long': long};
  }
}
