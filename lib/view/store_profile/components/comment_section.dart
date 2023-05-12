import 'package:flutter/material.dart';

import 'comment_detail.dart';

Widget commentSection() {
  var commentCount = 3;
  var scoresNumber = 5555;
  var scoresAverage = 4.6;

  return Column(
    children: [
      Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'نظرات',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    scoresAverage.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: scoresAverage >= 3.0 ? Colors.green : Colors.red,
                    ),
                  ),
                  Text(
                    'از $scoresNumber امتیاز',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: commentCount,
          itemBuilder: (context, index) {
            return const Column(
              children: [
                Divider(
                  thickness: 2,
                  height: 2,
                  color: Colors.black,
                ),
                CommentDetail(),
              ],
            );
          },
        ),
      ),
    ],
  );
}
