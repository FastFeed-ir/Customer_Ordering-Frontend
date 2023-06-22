import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../utils/constants.dart';

Widget commentDetail(
    String author, String date, String comment, List<String> orders) {
  return Container(
    padding: const EdgeInsets.all(24),
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
                fontSize: 18,
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
            fontFamily: IranSansWeb,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
        const SizedBox(height: 8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final order in orders)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: GrayColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      order,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: IranSansWeb,
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
