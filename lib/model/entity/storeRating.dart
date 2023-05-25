class StoreRatingData {
  int? commentCount;
  int? ratingCount;
  double? averageRating;

  StoreRatingData({this.commentCount, this.ratingCount, this.averageRating});

  factory StoreRatingData.fromJson(Map<String, dynamic> json) {
    return StoreRatingData(
      commentCount: json['comment_count'],
      ratingCount: json['rating_count'],
      averageRating: json['average_rating'],
    );
  }
}
