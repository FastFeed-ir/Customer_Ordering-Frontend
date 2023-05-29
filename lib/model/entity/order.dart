class Order{
  int? id;
  int? tableNumber;
  String? description;
  int? store;
  Order({
    this.id,
    required this.tableNumber,
    this.description,
    this.store
  });
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      tableNumber: json['table_number'],
      description: json['description'],
      store: json['store'],
    );
  }
  Map<String, dynamic> toJson() => {
    'table_number' : tableNumber,
    'title': description,
    'store': store,
  };
}