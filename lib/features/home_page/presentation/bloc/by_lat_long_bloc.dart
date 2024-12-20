import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_home_screen/core/resource/api_state.dart';
import 'package:weather_home_screen/core/resource/constants.dart';
import 'package:weather_home_screen/core/resource/location_checks.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/locality_entity.dart';
import 'package:weather_home_screen/features/home_page/domain/usecase/get_weather_bylatlong_usecase.dart';
import 'package:weather_home_screen/features/home_page/presentation/bloc/by_lat_long_event.dart';
import 'package:weather_home_screen/features/home_page/presentation/bloc/by_lat_long_state.dart';
import 'package:weather_home_screen/core/resource/entension.dart';

class ByLatLongBloc extends Bloc<EventByLatLong, ByLatLongState> {
  final GetWeatherByLatLongUseCase _getWeatherByLatLongUseCase;

  // Use private fields with getters if needed
  String _lat = DEFAULT_LAT.toString();
  String _long = DEFAULT_LONG.toString();

  String get latitude => _lat;
  String get longitude => _long;

  ByLatLongBloc(this._getWeatherByLatLongUseCase)
      : super(ByLatLongState(locationsList: [])) {
    on<GetWeatherForLocation>(_handleGetWeatherForLocation);
    on<ByLatLngInitialEvent>(_handleInitialEvent);
    on<GetByLatLongEvent>(_handleGetByLatLong);
    on<EventFetchLocation>(_handleFetchLocation);
  }

  // Separate event handlers for better organization
  Future<void> _handleGetWeatherForLocation(
    GetWeatherForLocation event,
    Emitter<ByLatLongState> emit,
  ) async {
    final location = state.locationsList[event.index].locationObj!;
    await _getByLatLongData(
      location.lat,
      location.long,
      location.locality,
      event.index,
      emit,
    );
  }

  Future<void> _handleInitialEvent(
    ByLatLngInitialEvent event,
    Emitter<ByLatLongState> emit,
  ) async {
    await _getCurrentLocation(emit: emit);
  }

  Future<void> _handleGetByLatLong(
    GetByLatLongEvent event,
    Emitter<ByLatLongState> emit,
  ) async {
    await _getByLatLongData(
      event.lat,
      event.long,
      null,
      0,
      emit,
    );
  }

  Future<void> _handleFetchLocation(
    EventFetchLocation event,
    Emitter<ByLatLongState> emit,
  ) async {
    await _fetchLocationAndCallByLatLong(emit);
  }

  Future<void> _getCurrentLocation({
    String? lat,
    String? long,
    required Emitter<ByLatLongState> emit,
  }) async {
    await _getByLatLongData(
      lat ?? _lat,
      long ?? _long,
      null,
      0,
      emit,
    );
  }

  Future<void> _getByLatLongData(
    String? lat,
    String? long,
    EntityLocality? locality,
    int index,
    Emitter<ByLatLongState> emit,
  ) async {
    emit(state.copyWith(
        apiState: ApiLoading(),
        locationStatus: await LocationStatus.checkLocationStatus()));

    final apiResult = await _getWeatherByLatLongUseCase.call(
      params: RequestByLatLong(
        lat: lat ?? DEFAULT_LAT.toString(),
        long: long ?? DEFAULT_LONG.toString(),
        locality: locality,
      ),
    );

    apiResult.analyzeSimple(
      onSuccess: (data, msg) async {
        if (index == 0) {
          var isLocationEnabled = await LocationStatus.isGpsEnabled();
          data?.locationObj?.locationEnabled = isLocationEnabled;
        }

        var locations = state.locationsList;
        locations[index] = data!;
        // state.locationsList[index] = data!;
        safeEmit(
            state.copyWith(locationsList: locations, apiState: ApiSuccess()));

        if (index == 0) {
          currentLatCons = lat;
          currentLongCons = long;
        }
      },
      onServerError: (msg) {
        emit(state.copyWith(
          apiState: ApiException(Exception(msg)),
        ));
      },
      onError: (e) {
        emit(state.copyWith(
          apiState: ApiException(e!),
        ));
      },
    );
  }

  Future<void> _fetchLocationAndCallByLatLong(
      Emitter<ByLatLongState> emit) async {
    try {
      final position = await LocationStatus.fetchGpsLocation(
        fallbackLat: double.parse(_lat),
        fallbackLong: double.parse(_long),
      );

      _lat = position.latitude.toString();
      _long = position.longitude.toString();

      await _getCurrentLocation(
        lat: _lat,
        long: _long,
        emit: emit,
      );
    } catch (e) {
      emit(state.copyWith(
        apiState: ApiException(Exception('Failed to fetch location: $e')),
      ));
    }
  }
}
