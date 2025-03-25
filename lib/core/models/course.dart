// Model cho thông tin khóa học
class Course {
  final String id;
  final String name;
  final String code;
  final String description;
  final String instructorId;
  final String instructorName;
  final String instructor;
  final int credits;
  final String level;
  final String duration;
  final int maxStudents;
  final int currentStudents;
  final double price;
  final String status;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String createdAt;
  final String updatedAt;

  Course({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.instructorId,
    required this.instructorName,
    required this.instructor,
    required this.credits,
    required this.level,
    required this.duration,
    required this.maxStudents,
    required this.currentStudents,
    required this.price,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  // Chuyển đổi từ JSON sang đối tượng Course
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      description: json['description'],
      instructorId: json['instructorId'],
      instructorName: json['instructorName'],
      instructor: json['instructor'],
      credits: json['credits'],
      level: json['level'],
      duration: json['duration'],
      maxStudents: json['maxStudents'],
      currentStudents: json['currentStudents'],
      price: json['price'].toDouble(),
      status: json['status'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      location: json['location'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  // Chuyển đổi từ đối tượng Course sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'instructorId': instructorId,
      'instructorName': instructorName,
      'instructor': instructor,
      'credits': credits,
      'level': level,
      'duration': duration,
      'maxStudents': maxStudents,
      'currentStudents': currentStudents,
      'price': price,
      'status': status,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'location': location,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // Tạo bản sao của Course với một số thay đổi
  Course copyWith({
    String? id,
    String? name,
    String? code,
    String? description,
    String? instructorId,
    String? instructorName,
    String? instructor,
    int? credits,
    String? level,
    String? duration,
    int? maxStudents,
    int? currentStudents,
    double? price,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
    String? createdAt,
    String? updatedAt,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      instructorId: instructorId ?? this.instructorId,
      instructorName: instructorName ?? this.instructorName,
      instructor: instructor ?? this.instructor,
      credits: credits ?? this.credits,
      level: level ?? this.level,
      duration: duration ?? this.duration,
      maxStudents: maxStudents ?? this.maxStudents,
      currentStudents: currentStudents ?? this.currentStudents,
      price: price ?? this.price,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}