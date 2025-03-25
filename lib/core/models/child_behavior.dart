// Model cho hành vi của con
class ChildBehavior {
  final String id;
  final String childId;
  final DateTime date;
  final String type;
  final String description;
  final String teacher;
  final String severity;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ChildBehavior({
    required this.id,
    required this.childId,
    required this.date,
    required this.type,
    required this.description,
    required this.teacher,
    required this.severity,
    this.notes,
    required this.createdAt,
    this.updatedAt,
  });

  // Chuyển đổi từ JSON sang đối tượng ChildBehavior
  factory ChildBehavior.fromJson(Map<String, dynamic> json) {
    return ChildBehavior(
      id: json['id'],
      childId: json['childId'],
      date: DateTime.parse(json['date']),
      type: json['type'],
      description: json['description'],
      teacher: json['teacher'],
      severity: json['severity'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Chuyển đổi từ đối tượng ChildBehavior sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'childId': childId,
      'date': date.toIso8601String(),
      'type': type,
      'description': description,
      'teacher': teacher,
      'severity': severity,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
} 