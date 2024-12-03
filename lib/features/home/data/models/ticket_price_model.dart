import 'package:almabad/core/constant/firebase_constant.dart';
import 'package:almabad/features/home/domain/entities/ticket_price.dart';

class TicketPriceModel extends TicketPrice {
  TicketPriceModel(
      {required super.egyptionStudent,
      required super.egyption,
      required super.arab,
      required super.foreign});

  factory TicketPriceModel.fromJson(Map<String, dynamic> json) {
    return TicketPriceModel(
        egyptionStudent: json[FirebaseConstant.ticketPriceEgyptionStudent],
        egyption: json[FirebaseConstant.ticketPriceEgyption],
        arab: json[FirebaseConstant.ticketPriceArab],
        foreign: json[FirebaseConstant.ticketPriceForeign]);
  }

  toJson() {
    return {
      FirebaseConstant.ticketPriceEgyptionStudent: egyptionStudent,
      FirebaseConstant.ticketPriceEgyption: egyption,
      FirebaseConstant.ticketPriceArab: arab,
      FirebaseConstant.ticketPriceForeign: foreign,
    };
  }

  factory TicketPriceModel.fromTicketPrice(TicketPrice price) {
    return TicketPriceModel(
        egyptionStudent: price.egyptionStudent,
        egyption: price.egyption,
        arab: price.arab,
        foreign: price.foreign);
  }
}
