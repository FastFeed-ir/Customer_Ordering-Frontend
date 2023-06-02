class ProductRatingData {
  int? ratingCount;
  double? averageRating;

  ProductRatingData({this.ratingCount, this.averageRating});

  factory ProductRatingData.fromJson(Map<String, dynamic> json) {
    return ProductRatingData(
      ratingCount: json['rating_count'],
      averageRating: json['average_rating'],
    );
  }
}
