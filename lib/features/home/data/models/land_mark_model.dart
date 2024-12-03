import 'package:almabad/core/constant/firebase_constant.dart';
import 'package:almabad/features/home/domain/entities/land_mark.dart';

class LandMarkModel extends LandMark {
  LandMarkModel(
      {required super.name,
      required super.description,
      required super.iamge,
      required super.inTicket});

  factory LandMarkModel.fromJson(Map<String, dynamic> json) {
    return LandMarkModel(
        name: json[FirebaseConstant.landmarkName],
        description: json[FirebaseConstant.landmarkDescription],
        iamge: json[FirebaseConstant.landmarkImage],
        inTicket: json[FirebaseConstant.landmarkInTicket]);
  }

  toJson() {
    return {
      FirebaseConstant.landmarkName: name,
      FirebaseConstant.landmarkDescription: description,
      FirebaseConstant.landmarkImage: iamge,
      FirebaseConstant.landmarkInTicket: inTicket,
    };
  }

  factory LandMarkModel.fromMarkModel(LandMark landMark) {
    return LandMarkModel(
        name: landMark.name,
        description: landMark.description,
        iamge: landMark.iamge,
        inTicket: landMark.inTicket);
  }
}
