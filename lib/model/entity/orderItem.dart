class OrderItem {
  int? id;
  int? product;
  String? productTitle;
  double? productUnitPrice;
  int? quantity;
  int? order;

  OrderItem({
    this.id,
    this.product,
    this.productTitle,
    this.productUnitPrice,
    this.quantity,
    this.order,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      productTitle: json['product_title'],
      productUnitPrice: double.parse(json['product_unit_price'],),
      quantity: json['quantity'],
      product: json['product'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() => {
    'product': product,
    'quantity': quantity,
    'order': order,
    'product_title': productTitle,
    'product_unit_price': productUnitPrice,
  };
}
