class SaleItem {
  final String saleItemId;
  final String saleId;
  final String inventoryItemId;
  final int quantity;

  SaleItem({
    required this.saleItemId,
    required this.saleId,
    required this.inventoryItemId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'saleItemId': saleItemId,
      'saleId': saleId,
      'inventoryItemId': inventoryItemId,
      'quantity': quantity,
    };
  }

  factory SaleItem.fromMap(Map<String, dynamic> map) {
    return SaleItem(
      saleItemId: map['saleItemId'],
      saleId: map['saleId'],
      inventoryItemId: map['inventoryItemId'],
      quantity: map['quantity'],
    );
  }
}
