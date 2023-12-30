import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';

Widget informationDetail(
  IconData icon,
  String title,
  String subtitle,
) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20,10,20,10),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 4.0),
            Text(
              '$title:',
              style: const TextStyle(
                color: Colors.black,
                fontFamily: IranSansWeb,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          subtitle,
          style: const TextStyle(
            fontFamily: IranSansWeb,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ],
    ),
  );
}
