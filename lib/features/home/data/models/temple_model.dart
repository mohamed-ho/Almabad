import 'package:almabad/core/constant/firebase_constant.dart';
import 'package:almabad/features/home/data/models/land_mark_model.dart';
import 'package:almabad/features/home/data/models/ticket_price_model.dart';
import 'package:almabad/features/home/domain/entities/land_mark.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TempleModel extends Temple {
  TempleModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.location,
      required super.openTime,
      required super.closeTime,
      required super.imagePath,
      required super.landmarks,
      required super.numberOfLikes,
      required super.price});

  factory TempleModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot queryDocumentSnapshot) {
    return TempleModel(
        id: queryDocumentSnapshot.id,
        name: queryDocumentSnapshot[FirebaseConstant.templeName],
        description: queryDocumentSnapshot[FirebaseConstant.templeDescription],
        location: queryDocumentSnapshot[FirebaseConstant.templeLocation],
        openTime: queryDocumentSnapshot[FirebaseConstant.templeOpenTime],
        closeTime: queryDocumentSnapshot[FirebaseConstant.templeCloseTime],
        imagePath: queryDocumentSnapshot[FirebaseConstant.templeImage],
        landmarks: List<LandMark>.from(
            queryDocumentSnapshot[FirebaseConstant.templeLandMarks]
                .map((e) => LandMarkModel.fromJson(e))),
        numberOfLikes:
            queryDocumentSnapshot[FirebaseConstant.templeNumberOfLikes],
        price: TicketPriceModel.fromJson(
            queryDocumentSnapshot[FirebaseConstant.templePrice]));
  }

  factory TempleModel.fromJson(Map<String, dynamic> json) {
    return TempleModel(
        id: 'id',
        name: json[FirebaseConstant.templeName],
        description: json[FirebaseConstant.templeDescription],
        location: json[FirebaseConstant.templeLocation],
        openTime: json[FirebaseConstant.templeOpenTime],
        closeTime: json[FirebaseConstant.templeCloseTime],
        imagePath: json[FirebaseConstant.templeImage],
        landmarks: List<LandMark>.from(json[FirebaseConstant.templeLandMarks]
            .map((e) => LandMarkModel.fromJson(e))),
        numberOfLikes: json[FirebaseConstant.templeNumberOfLikes],
        price: TicketPriceModel.fromJson(json[FirebaseConstant.templePrice]));
  }

  toJson() {
    return {
      FirebaseConstant.templeName: name,
      FirebaseConstant.templeDescription: description,
      FirebaseConstant.templeLocation: location,
      FirebaseConstant.templeOpenTime: openTime,
      FirebaseConstant.templeCloseTime: closeTime,
      FirebaseConstant.templeNumberOfLikes: numberOfLikes,
      FirebaseConstant.templeImage: imagePath,
      FirebaseConstant.templePrice:
          TicketPriceModel.fromTicketPrice(price).toJson(),
      FirebaseConstant.templeLandMarks: landMarkConverter(landmarks),
    };
  }

  List<Map<String, dynamic>> landMarkConverter(List<LandMark> landmarks) {
    return List<Map<String, dynamic>>.from(
        landmarks.map((e) => LandMarkModel.fromMarkModel(e).toJson()));
  }

  factory TempleModel.fromTemple(Temple temple) {
    return TempleModel(
        id: temple.id,
        name: temple.name,
        description: temple.description,
        location: temple.location,
        openTime: temple.openTime,
        closeTime: temple.closeTime,
        imagePath: temple.imagePath,
        landmarks: temple.landmarks,
        numberOfLikes: temple.numberOfLikes,
        price: temple.price);
  }
}
