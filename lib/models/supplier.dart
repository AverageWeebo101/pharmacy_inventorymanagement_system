class Supplier {
  final String supplierId;
  final String supplierName;
  final String supplierContact;

  Supplier({
    required this.supplierId,
    required this.supplierName,
    required this.supplierContact,
  });

  Map<String, dynamic> toMap() {
    return {
      'supplierId': supplierId,
      'supplierName': supplierName,
      'supplierContact': supplierContact,
    };
  }

  factory Supplier.fromMap(Map<String, dynamic> map) {
    return Supplier(
      supplierId: map['supplierId'],
      supplierName: map['supplierName'],
      supplierContact: map['supplierContact'],
    );
  }
}
