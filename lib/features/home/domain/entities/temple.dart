import 'package:almabad/features/home/domain/entities/land_mark.dart';
import 'package:almabad/features/home/domain/entities/ticket_price.dart';

class Temple {
  final String id;
  final String name;
  final String description;
  final String location;
  final String openTime;
  final String closeTime;
  final String imagePath;
  final List<LandMark> landmarks;
  final int numberOfLikes;
  final TicketPrice price;

  Temple(
      {required this.id,
      required this.name,
      required this.description,
      required this.location,
      required this.openTime,
      required this.closeTime,
      required this.imagePath,
      required this.landmarks,
      required this.numberOfLikes,
      required this.price});
}
