import 'package:almabad/features/home/domain/entities/land_mark.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';

class HeroTagsHandler {
  static String mainTempleImageTag(Temple temple) =>
      temple.name + temple.imagePath;
  static String templeNameTag(Temple temple) => temple.name + temple.id;
  static String templeDescription(Temple temple) =>
      temple.name + temple.description;
  static String templeLikes(Temple temple) =>
      temple.id + temple.numberOfLikes.toString();
  static String templeLandmarkTag(LandMark landmark) =>
      landmark.name + landmark.description;
}
