class Rating{
  int? id;
  int? score;
  int? product;

  Rating({
    this.id,
    required this.score,
    this.product,
});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'],
      score: json['score'],
      product: json['product'],
    );
  }
  Map<String, dynamic> toJson() => {
  'id'  : id,
  'score' :  score,
  'product' : product,
  };
}
