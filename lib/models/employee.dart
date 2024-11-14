class Employee {
  final String employeeId;
  final String name;
  final String email;
  final String role;
  final String permissions;

  Employee(
      {required this.employeeId,
      required this.name,
      required this.email,
      required this.role,
      required this.permissions});

  Map<String, dynamic> toMap() {
    return {
      'employeeId': employeeId,
      'name': name,
      'email': email,
      'role': role,
      'permissions': permissions,
    };
  }

  static fromMap(Map<String, Object?> e) {}
}
