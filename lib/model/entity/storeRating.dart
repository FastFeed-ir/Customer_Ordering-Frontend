class StoreRatingData {
  String? name;
  int? commentCount;
  int? ratingCount;
  double? averageRating;

  StoreRatingData({this.name,this.commentCount, this.ratingCount, this.averageRating});

  factory StoreRatingData.fromJson(Map<String, dynamic> json) {
    return StoreRatingData(
      name: json['name'],
      commentCount: json['comment_count'],
      ratingCount: json['rating_count'],
      averageRating: json['average_rating'],
    );
  }
}
