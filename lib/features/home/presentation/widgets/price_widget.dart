import 'package:almabad/features/home/domain/entities/ticket_price.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price});
  final TicketPrice price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).price,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          Table(children: priceTableRow(price)),
        ],
      ),
    );
  }
}

List<TableRow> priceTableRow(TicketPrice price) {
  return [
    TableRow(decoration: const BoxDecoration(color: Colors.grey), children: [
      Text(
        S.current.person,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        S.current.price,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )
    ]),
    TableRow(children: [
      Text(
        S.current.egyptionStudent,
        style: const TextStyle(fontSize: 16),
      ),
      Text(
        price.egyptionStudent.toString(),
        style: const TextStyle(fontSize: 16),
      )
    ]),
    TableRow(children: [
      Text(
        S.current.egyption,
        style: const TextStyle(fontSize: 16),
      ),
      Text(
        price.egyption.toString(),
        style: const TextStyle(fontSize: 16),
      )
    ]),
    TableRow(children: [
      Text(
        S.current.arabic,
        style: const TextStyle(fontSize: 16),
      ),
      Text(
        price.arab.toString(),
        style: const TextStyle(fontSize: 16),
      )
    ]),
    TableRow(children: [
      Text(
        S.current.forgein,
        style: const TextStyle(fontSize: 16),
      ),
      Text(
        price.foreign.toString(),
        style: const TextStyle(fontSize: 16),
      )
    ]),
  ];
}
