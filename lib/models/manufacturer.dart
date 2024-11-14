class Manufacturer {
  final String manufacturerId;
  final String manufacturerName;
  final String manufacturerContact;

  Manufacturer({
    required this.manufacturerId,
    required this.manufacturerName,
    required this.manufacturerContact,
  });

  Map<String, dynamic> toMap() {
    return {
      'manufacturerId': manufacturerId,
      'manufacturerName': manufacturerName,
      'manufacturerContact': manufacturerContact,
    };
  }

  factory Manufacturer.fromMap(Map<String, dynamic> map) {
    return Manufacturer(
      manufacturerId: map['manufacturerId'],
      manufacturerName: map['manufacturerName'],
      manufacturerContact: map['manufacturerContact'],
    );
  }
}
