class Product {
  final String productId;
  final String productName;
  final String manufacturerId;
  final DateTime expirationDate;

  Product({
    required this.productId,
    required this.productName,
    required this.manufacturerId,
    required this.expirationDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'manufacturerId': manufacturerId,
      'expirationDate': expirationDate.toIso8601String(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'],
      productName: map['productName'],
      manufacturerId: map['manufacturerId'],
      expirationDate: DateTime.parse(map['expirationDate']),
    );
  }
}
