class OrderItem{

  int? id ;
  String? product_title;
  double? product_unit_price;
  int? quantity;
  int? product;
  int? order;

  OrderItem({
    this.id,
    this.product_title,
    this.product_unit_price,
    required this.quantity,
    this.product,
    this.order,
  });
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      product_title: json['product_title'],
      product_unit_price: json['product_unit_price'],
      quantity: json['quantity'],
      product: json['product'],
      order: json['order'],
    );
  }
  Map<String, dynamic> toJson() => {
    'product_title' : product_title,
    'product_unit_price': product_unit_price,
    'quantity': quantity,
    'product': product,
    'order': order,
  };
}