import 'dart:async';

import 'package:flutter/material.dart';

import '../model/entity/comment.dart';
import '../model/repository/comment_repository_impl.dart';

class CommentViewModel extends ChangeNotifier {
  var repository = CommentRepositoryImpl();

  StreamController<List<Comment>> comments = StreamController<List<Comment>>();

  void getComments(int storeId) async {
    comments.add(await repository.getComments(storeId));
    notifyListeners();
  }
}
