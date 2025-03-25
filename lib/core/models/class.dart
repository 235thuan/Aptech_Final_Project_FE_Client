class Class {
  final String id;
  final String name;
  final String description;
  final String courseId;
  final String courseName;
  final String teacherId;
  final String teacherName;
  final String schedule;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final int capacity;
  final int currentStudents;
  final String status;

  Class({
    required this.id,
    required this.name,
    required this.description,
    required this.courseId,
    required this.courseName,
    required this.teacherId,
    required this.teacherName,
    required this.schedule,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.capacity,
    required this.currentStudents,
    required this.status,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      teacherId: json['teacherId'],
      teacherName: json['teacherName'],
      schedule: json['schedule'],
      location: json['location'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      capacity: json['capacity'],
      currentStudents: json['currentStudents'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'courseId': courseId,
      'courseName': courseName,
      'teacherId': teacherId,
      'teacherName': teacherName,
      'schedule': schedule,
      'location': location,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'capacity': capacity,
      'currentStudents': currentStudents,
      'status': status,
    };
  }
} 