class InventoryItem {
  final String inventoryItemId;
  final String inventoryItemName;
  final int quantity;
  final String supplierId;
  final String? medicineId;
  final String? productId;
  final DateTime expirationDate;

  InventoryItem({
    required this.inventoryItemId,
    required this.inventoryItemName,
    required this.quantity,
    required this.supplierId,
    this.medicineId,
    this.productId,
    required this.expirationDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'inventoryItemId': inventoryItemId,
      'inventoryItemName': inventoryItemName,
      'quantity': quantity,
      'supplierId': supplierId,
      'medicineId': medicineId,
      'productId': productId,
      'expirationDate': expirationDate.toIso8601String(),
    };
  }

  factory InventoryItem.fromMap(Map<String, dynamic> map) {
    return InventoryItem(
      inventoryItemId: map['inventoryItemId'],
      inventoryItemName: map['inventoryItemName'],
      quantity: map['quantity'],
      supplierId: map['supplierId'],
      medicineId: map['medicineId'],
      productId: map['productId'],
      expirationDate: DateTime.parse(map['expirationDate']),
    );
  }
}
