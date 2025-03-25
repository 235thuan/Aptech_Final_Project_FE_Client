// Model cho giảng viên
class Teacher {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String specialization;
  final String qualification;
  final String status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Teacher({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.specialization,
    required this.qualification,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  // Chuyển đổi từ JSON sang đối tượng Teacher
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      specialization: json['specialization'],
      qualification: json['qualification'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Chuyển đổi từ đối tượng Teacher sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'specialization': specialization,
      'qualification': qualification,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
} 