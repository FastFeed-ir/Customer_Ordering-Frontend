class Comment {
  int? id;
  String name;
  String content;
  int orderId;
  int? storeId;
  String createdAt;

  Comment({
    this.id,
    required this.name,
    required this.content,
    required this.orderId,
    required this.createdAt,
    this.storeId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      name: json['name'],
      content: json['content'],
      orderId: json['order'],
      createdAt: json['created_at'],
      storeId: json['store'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'content': content,
        'created_at': createdAt,
        'order': orderId,
        'store': storeId,
      };
}
