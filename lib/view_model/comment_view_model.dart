import 'dart:async';

import 'package:customer_ordering_frontend/model/entity/comment.dart';
import 'package:flutter/cupertino.dart';

import '../model/repository/comment_repository_impl.dart';

class CommentViewModel extends ChangeNotifier {
  var repository = CommentRepositoryImpl();

  StreamController<List<Comment>> collections =
      StreamController<List<Comment>>();

  void getComments(int storeId) async {
    collections.add(await repository.getComments(storeId));
    notifyListeners();
  }

  Future<int> addComment(Comment comment) async {
    var newCollection = await repository.addComment(comment);
    notifyListeners();
    return newCollection.id ?? 0;
  }
}
