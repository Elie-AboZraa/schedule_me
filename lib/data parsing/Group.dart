class Group {
  final String? groupId;
  final String? groupCode;
  final String? groupType;
  final int? capacity;
  final int? studentsCount;
  final String? room;
  final Map<String, dynamic> schedule;

  Group({
    this.groupId,
    this.groupCode,
    this.groupType,
    this.capacity,
    this.studentsCount,
    this.room,
    required this.schedule,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    final schedule = <String, dynamic>{};
    const days = ['SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI'];
    for (var day in days) {
      if (json[day] != null && json[day] != '-') {
        schedule[day] = json[day];
      }
    }

    return Group(
      groupId: json['GROUP_ID'] as String?,
      groupCode: json['GROUP_CODE'] as String?,
      groupType: json['GROUP_TYPE'] as String?,
      capacity: json['GROUP_CAPACITY'] as int?,
      studentsCount: json['STUDENTS_COUNT'] as int?,
      room: json['ROOM_NAME_PL'] as String?,
      schedule: schedule,
    );
  }

  Map<String, dynamic> toJson() => {
        'GROUP_ID': groupId,
        'GROUP_CODE': groupCode,
        'GROUP_TYPE': groupType,
        'GROUP_CAPACITY': capacity,
        'STUDENTS_COUNT': studentsCount,
        'ROOM_NAME_PL': room,
        ...schedule,
      };
}
