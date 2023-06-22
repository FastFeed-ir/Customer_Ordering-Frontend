import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

Widget commentDetail(String author, String date, String comment) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20,10,20,10),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              author,
              style: const TextStyle(
                fontFamily: IranSansWeb,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              date.toPersianDigit(),
              style: const TextStyle(
                fontFamily: IranSansWeb,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          comment,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
      ],
    ),
  );
}
