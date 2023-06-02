class Order{
  int? id;
  int? tableNumber;
  String? description;
  int? store;
  int? authCode;
  Order({
    this.id,
    required this.tableNumber,
    this.description,
    required this.store,
    this.authCode,
  });
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      tableNumber: json['table_number'],
      description: json['description'],
      store: json['store'],
      authCode: json['auth_code'],
    );
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'table_number' : tableNumber,
    'description': description,
    'store': store,
  };
}