class Comment {
  int? id;
  String name;
  String content;
  int orderId;
  int? storeId;

  Comment({
    this.id,
    required this.name,
    required this.content,
    required this.orderId,
    this.storeId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      name: json['name'],
      content: json['content'],
      orderId: json['order'],
      storeId: json['store'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'content': content,
        'order': orderId,
        'store': storeId,
      };
}
