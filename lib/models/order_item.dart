class OrderItem {
  final String orderItemId;
  final String orderId;
  final String inventoryItemId;
  final int quantity;

  OrderItem({
    required this.orderItemId,
    required this.orderId,
    required this.inventoryItemId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderItemId': orderItemId,
      'orderId': orderId,
      'inventoryItemId': inventoryItemId,
      'quantity': quantity,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      orderItemId: map['orderItemId'],
      orderId: map['orderId'],
      inventoryItemId: map['inventoryItemId'],
      quantity: map['quantity'],
    );
  }
}
