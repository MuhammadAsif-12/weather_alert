// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'by_lat_long_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ByLatLongStateCWProxy {
  ByLatLongState locationsList(List<EntityWeatherData> locationsList);

  ByLatLongState apiState(ApiState<bool> apiState);

  ByLatLongState locationStatus(LocationStatus? locationStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ByLatLongState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ByLatLongState(...).copyWith(id: 12, name: "My name")
  /// ````
  ByLatLongState call({
    List<EntityWeatherData> locationsList,
    ApiState<bool> apiState,
    LocationStatus? locationStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfByLatLongState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfByLatLongState.copyWith.fieldName(...)`
class _$ByLatLongStateCWProxyImpl implements _$ByLatLongStateCWProxy {
  const _$ByLatLongStateCWProxyImpl(this._value);

  final ByLatLongState _value;

  @override
  ByLatLongState locationsList(List<EntityWeatherData> locationsList) =>
      this(locationsList: locationsList);

  @override
  ByLatLongState apiState(ApiState<bool> apiState) => this(apiState: apiState);

  @override
  ByLatLongState locationStatus(LocationStatus? locationStatus) =>
      this(locationStatus: locationStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ByLatLongState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ByLatLongState(...).copyWith(id: 12, name: "My name")
  /// ````
  ByLatLongState call({
    Object? locationsList = const $CopyWithPlaceholder(),
    Object? apiState = const $CopyWithPlaceholder(),
    Object? locationStatus = const $CopyWithPlaceholder(),
  }) {
    return ByLatLongState(
      locationsList: locationsList == const $CopyWithPlaceholder()
          ? _value.locationsList
          // ignore: cast_nullable_to_non_nullable
          : locationsList as List<EntityWeatherData>,
      apiState: apiState == const $CopyWithPlaceholder()
          ? _value.apiState
          // ignore: cast_nullable_to_non_nullable
          : apiState as ApiState<bool>,
      locationStatus: locationStatus == const $CopyWithPlaceholder()
          ? _value.locationStatus
          // ignore: cast_nullable_to_non_nullable
          : locationStatus as LocationStatus?,
    );
  }
}

extension $ByLatLongStateCopyWith on ByLatLongState {
  /// Returns a callable class that can be used as follows: `instanceOfByLatLongState.copyWith(...)` or like so:`instanceOfByLatLongState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ByLatLongStateCWProxy get copyWith => _$ByLatLongStateCWProxyImpl(this);
}
