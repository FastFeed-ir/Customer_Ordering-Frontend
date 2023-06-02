import 'package:customer_ordering_frontend/model/entity/comment.dart';
import 'package:flutter/material.dart';

import 'comment_detail.dart';

Widget commentSection(List<Comment> comments) {
  return Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            Comment comment = comments[index];
            return Column(
              children: [
                commentDetail(
                  comment.name,
                  comment.createdAt!,
                  comment.content,
                ),
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
