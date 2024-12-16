// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Car {
  final String model;
  final double distance;
  final int fuelCapacity;
  final double pricePerHour;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  Car copyWith({
    String? model,
    double? distance,
    int? fuelCapacity,
    double? pricePerHour,
  }) {
    return Car(
      model: model ?? this.model,
      distance: distance ?? this.distance,
      fuelCapacity: fuelCapacity ?? this.fuelCapacity,
      pricePerHour: pricePerHour ?? this.pricePerHour,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'model': model,
      'distance': distance,
      'fuelCapacity': fuelCapacity,
      'pricePerHour': pricePerHour,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      model: map['model'] as String,
      distance: map['distance'] as double,
      fuelCapacity: map['fuelCapacity'] as int,
      pricePerHour: map['pricePerHour'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Car(model: $model, distance: $distance, fuelCapacity: $fuelCapacity, pricePerHour: $pricePerHour)';
  }

  @override
  bool operator ==(covariant Car other) {
    if (identical(this, other)) return true;
  
    return 
      other.model == model &&
      other.distance == distance &&
      other.fuelCapacity == fuelCapacity &&
      other.pricePerHour == pricePerHour;
  }

  @override
  int get hashCode {
    return model.hashCode ^
      distance.hashCode ^
      fuelCapacity.hashCode ^
      pricePerHour.hashCode;
  }
}
