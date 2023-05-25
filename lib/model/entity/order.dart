class Order{
  int? id;
  int? table_number;
  String? description;
  int? store;
  Order({
    this.id,
    required this.table_number,
    this.description,
    this.store
  });
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      table_number: json['table_number'],
      description: json['description'],
      store: json['store'],
    );
  }
  Map<String, dynamic> toJson() => {
    'table_number' : table_number,
    'title': description,
    'store': store,
  };
}