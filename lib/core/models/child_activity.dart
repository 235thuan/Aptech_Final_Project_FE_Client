// Model cho hoạt động của con
class ChildActivity {
  final String id;
  final String childId;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String status;
  final String type;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ChildActivity({
    required this.id,
    required this.childId,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.status,
    required this.type,
    this.notes,
    required this.createdAt,
    this.updatedAt,
  });

  // Chuyển đổi từ JSON sang đối tượng ChildActivity
  factory ChildActivity.fromJson(Map<String, dynamic> json) {
    return ChildActivity(
      id: json['id'],
      childId: json['childId'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      location: json['location'],
      status: json['status'],
      type: json['type'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Chuyển đổi từ đối tượng ChildActivity sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'childId': childId,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'location': location,
      'status': status,
      'type': type,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
} 