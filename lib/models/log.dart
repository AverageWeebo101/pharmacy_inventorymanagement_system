class Log {
  final String logId;
  final String event;
  final String eventDetail;
  final DateTime eventDate;
  final String employeeId;
  final bool viewableByAdmin;
  final bool viewableByOwner;

  Log({
    required this.logId,
    required this.event,
    required this.eventDetail,
    required this.eventDate,
    required this.employeeId,
    this.viewableByAdmin = true,
    this.viewableByOwner = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'logId': logId,
      'event': event,
      'eventDetail': eventDetail,
      'eventDate': eventDate.toIso8601String(),
      'employeeId': employeeId,
      'viewableByAdmin': viewableByAdmin ? 1 : 0,
      'viewableByOwner': viewableByOwner ? 1 : 0,
    };
  }

  factory Log.fromMap(Map<String, dynamic> map) {
    return Log(
      logId: map['logId'],
      event: map['event'],
      eventDetail: map['eventDetail'],
      eventDate: DateTime.parse(map['eventDate']),
      employeeId: map['employeeId'],
      viewableByAdmin: map['viewableByAdmin'] == 1,
      viewableByOwner: map['viewableByOwner'] == 1,
    );
  }
}
