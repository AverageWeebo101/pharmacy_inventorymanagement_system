class Order {
  final String orderId;
  final DateTime orderDate;
  final String employeeId;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.employeeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'orderDate': orderDate.toIso8601String(),
      'employeeId': employeeId,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderId: map['orderId'],
      orderDate: DateTime.parse(map['orderDate']),
      employeeId: map['employeeId'],
    );
  }
}
