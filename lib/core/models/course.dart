// Model cho thông tin môn học
class Course {
  final String id;
  final String name;
  final String code;
  final String description;
  final int credits;
  final String instructor;
  final int maxStudents;
  final int currentStudents;
  final String schedule;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final String status; // 'open', 'closed', 'full'
  final List<String> prerequisites;
  final double price;

  Course({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.credits,
    required this.instructor,
    required this.maxStudents,
    required this.currentStudents,
    required this.schedule,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.prerequisites,
    required this.price,
  });

  // Chuyển đổi từ JSON sang đối tượng Course
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      description: json['description'],
      credits: json['credits'],
      instructor: json['instructor'],
      maxStudents: json['maxStudents'],
      currentStudents: json['currentStudents'],
      schedule: json['schedule'],
      location: json['location'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      status: json['status'],
      prerequisites: List<String>.from(json['prerequisites']),
      price: json['price'].toDouble(),
    );
  }

  // Chuyển đổi từ đối tượng Course sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'credits': credits,
      'instructor': instructor,
      'maxStudents': maxStudents,
      'currentStudents': currentStudents,
      'schedule': schedule,
      'location': location,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
      'prerequisites': prerequisites,
      'price': price,
    };
  }

  // Tạo bản sao của Course với một số thay đổi
  Course copyWith({
    String? id,
    String? name,
    String? code,
    String? description,
    int? credits,
    String? instructor,
    int? maxStudents,
    int? currentStudents,
    String? schedule,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    List<String>? prerequisites,
    double? price,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      credits: credits ?? this.credits,
      instructor: instructor ?? this.instructor,
      maxStudents: maxStudents ?? this.maxStudents,
      currentStudents: currentStudents ?? this.currentStudents,
      schedule: schedule ?? this.schedule,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      prerequisites: prerequisites ?? this.prerequisites,
      price: price ?? this.price,
    );
  }
}