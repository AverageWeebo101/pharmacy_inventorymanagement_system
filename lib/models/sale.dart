class Sale {
  final String saleId;
  final DateTime saleDate;
  final String employeeId;

  Sale({
    required this.saleId,
    required this.saleDate,
    required this.employeeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'saleId': saleId,
      'saleDate': saleDate.toIso8601String(),
      'employeeId': employeeId,
    };
  }

  factory Sale.fromMap(Map<String, dynamic> map) {
    return Sale(
      saleId: map['saleId'],
      saleDate: DateTime.parse(map['saleDate']),
      employeeId: map['employeeId'],
    );
  }
}
