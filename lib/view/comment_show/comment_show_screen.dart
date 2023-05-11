import 'package:customer_ordering_frontend/view/comment_show/components/comment_detail.dart';
import 'package:flutter/material.dart';

class CommentShow extends StatefulWidget {
  const CommentShow({Key? key}) : super(key: key);

  @override
  State<CommentShow> createState() => _CommentShowState();
}

class _CommentShowState extends State<CommentShow> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              CommentDetail(),
              Divider(
                thickness: 4,
                color: Colors.black,
              ),
            ],
          );
        },
      ),
    );
  }
}
