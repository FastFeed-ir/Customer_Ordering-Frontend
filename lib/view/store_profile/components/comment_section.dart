import 'package:customer_ordering_frontend/view/store_profile/components/comment_detail.dart';
import 'package:flutter/material.dart';

Widget commentSection() {
  var commentCount = 3;
  var scoresNumber = 5555;
  var scoresAverage = 4.6;
  var score = 3;
  var author = "نام";
  var date = "1400/12/12";
  var orders = ['سفارش ۱', 'سفارش ۲', 'سفارش ۳'];
  var comment =
      "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است،لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است،";

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
            return Column(
              children: [
                const Divider(
                  thickness: 2,
                  height: 2,
                  color: Colors.black,
                ),
                commentDetail(score, author, date, comment, orders),
              ],
            );
          },
        ),
      ),
    ],
  );
}
