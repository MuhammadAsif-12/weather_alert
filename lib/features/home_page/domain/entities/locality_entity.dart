import 'package:equatable/equatable.dart';

class EntityLocality extends Equatable {
  String? city;
  String? address;

  EntityLocality({this.city, this.address});

  @override
  List<Object?> get props => [city, address];

  @override
  String toString() {
    return "Address: $address | City: $city ";
  }

  Map<String, dynamic?> toJson() {
    return {'city': city, 'address': address};
  }

  factory EntityLocality.fromJson(Map<String, dynamic>? map) {
    return EntityLocality(
        city: map?["city"] ?? "", address: map?["address"] ?? "");
  }
}
