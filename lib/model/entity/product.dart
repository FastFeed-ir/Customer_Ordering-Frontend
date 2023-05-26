class Product {
  int? id;
  String title;
  String? image;
  String? description;
  double unitPrice;
  int? inventory;
  bool isAvailable;
  bool? isFeatured;
  double? discountPercentage;
  int collectionId;
  int storeId;
  int? Quantity = 0;
  double? priceCount = 0;
  Product({
    this.id,
    required this.title,
    this.image,
    this.description,
    required this.unitPrice,
    this.inventory,
    required this.isAvailable,
    this.isFeatured,
    this.discountPercentage,
    required this.collectionId,
    required this.storeId,
    this.Quantity,
    this.priceCount,
  });
  int get quantity => Quantity??0; // Add this getter

  set quantity(int value) {  // Add this setter
    Quantity = value;
  }
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        description: json['description'],
        unitPrice: double.parse(json['unit_price']),
        inventory: json['inventory'],
        isAvailable: json['is_available'],
        isFeatured: json['is_featured'],
        discountPercentage: json["discount_percentage"] == null
            ? null
            : double.parse(json["discount_percentage"]),
        collectionId: json['collection'],
        storeId: json['store']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
        'description': description,
        'unit_price': unitPrice,
        'inventory': inventory,
        'is_available': isAvailable,
        'is_featured': isFeatured,
        'discount_percentage': discountPercentage,
        'collection': collectionId,
      };
}
