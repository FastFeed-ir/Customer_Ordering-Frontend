class Rating {
  int? id;
  int score;
  int productId;
  Rating({this.id, required this.score, required this.productId});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      score: json['score'],
      productId: json['productId'],
    );
  }
  Map<String, dynamic> toJson() => {
        'score': score,
        'productId': productId,
      };
}
