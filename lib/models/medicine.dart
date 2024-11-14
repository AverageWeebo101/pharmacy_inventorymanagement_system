class Medicine {
  final String medicineId;
  final String medicineName;
  final String manufacturerId;
  final DateTime expirationDate;

  Medicine({
    required this.medicineId,
    required this.medicineName,
    required this.manufacturerId,
    required this.expirationDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'medicineId': medicineId,
      'medicineName': medicineName,
      'manufacturerId': manufacturerId,
      'expirationDate': expirationDate.toIso8601String(),
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      medicineId: map['medicineId'],
      medicineName: map['medicineName'],
      manufacturerId: map['manufacturerId'],
      expirationDate: DateTime.parse(map['expirationDate']),
    );
  }
}
