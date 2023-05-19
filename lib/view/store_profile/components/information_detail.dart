import 'package:flutter/material.dart';

Widget informationDetail(
  IconData icon,
  String title,
  String subtitle,
) {
  return Container(
    padding: const EdgeInsets.all(24),
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
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    ),
  );
}
