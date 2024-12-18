// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_weather_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EntityWeatherDataCWProxy {
  EntityWeatherData locationObj(EntityLocation? locationObj);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EntityWeatherData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EntityWeatherData(...).copyWith(id: 12, name: "My name")
  /// ````
  EntityWeatherData call({
    EntityLocation? locationObj,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEntityWeatherData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEntityWeatherData.copyWith.fieldName(...)`
class _$EntityWeatherDataCWProxyImpl implements _$EntityWeatherDataCWProxy {
  const _$EntityWeatherDataCWProxyImpl(this._value);

  final EntityWeatherData _value;

  @override
  EntityWeatherData locationObj(EntityLocation? locationObj) =>
      this(locationObj: locationObj);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EntityWeatherData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EntityWeatherData(...).copyWith(id: 12, name: "My name")
  /// ````
  EntityWeatherData call({
    Object? locationObj = const $CopyWithPlaceholder(),
  }) {
    return EntityWeatherData(
      locationObj: locationObj == const $CopyWithPlaceholder()
          ? _value.locationObj
          // ignore: cast_nullable_to_non_nullable
          : locationObj as EntityLocation?,
    );
  }
}

extension $EntityWeatherDataCopyWith on EntityWeatherData {
  /// Returns a callable class that can be used as follows: `instanceOfEntityWeatherData.copyWith(...)` or like so:`instanceOfEntityWeatherData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EntityWeatherDataCWProxy get copyWith =>
      _$EntityWeatherDataCWProxyImpl(this);
}
