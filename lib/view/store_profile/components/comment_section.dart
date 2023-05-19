import 'package:customer_ordering_frontend/model/entity/comment.dart';
import 'package:customer_ordering_frontend/view/store_profile/components/comment_detail.dart';
import 'package:flutter/material.dart';

Widget commentSection(List<Comment> comments) {
  var orders = ['سفارش ۱', 'سفارش ۲', 'سفارش ۳'];
  return Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            var comment = comments[index];
            return Column(
              children: [
                commentDetail(
                    comment.name, comment.createdAt, comment.content, orders),
                const Divider(
                  thickness: 2,
                  height: 2,
                  color: Colors.black,
                ),
              ],
            );
          },
        ),
      ),
    ],
  );
}
