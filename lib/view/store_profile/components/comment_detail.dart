import 'package:flutter/material.dart';

Widget commentDetail(int score, String author, String date, String comment,
    List<String> orders) {
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
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star_border,
                    size: 18.0,
                    color: score >= 3 ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    score.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          date,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12.0,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          comment,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            for (final order in orders)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      order,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    ),
  );
}