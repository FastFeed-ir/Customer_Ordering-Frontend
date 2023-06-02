import 'package:customer_ordering_frontend/model/entity/comment.dart';
import 'package:customer_ordering_frontend/view/store_profile/components/comment_detail.dart';
import 'package:flutter/material.dart';

Widget commentSection(Map<Comment, List<String>> commentsAndOrders) {
  return Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: commentsAndOrders.length,
          itemBuilder: (context, index) {
            Comment comment = commentsAndOrders.keys.toList()[index];
            List<String> ordersNames = commentsAndOrders.values.toList()[index];
            return Column(
              children: [
                commentDetail(comment.name, comment.createdAt, comment.content,
                    ordersNames),
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
