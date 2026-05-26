import 'package:equatable/equatable.dart';

class TripEntity extends Equatable {
  final String id;
  final String city;
  final String country;
  final String image;
  final double price;

  const TripEntity({
    required this.id,
    required this.city,
    required this.country,
    required this.image,
    required this.price,
  });

  @override
  List<Object?> get props => [id, city, country, image, price];
}
