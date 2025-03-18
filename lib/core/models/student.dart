import '../enums/user_role.dart';

// Model đại diện cho thông tin sinh viên
class Student {
  final String id;
  final String email;
  final String name;
  final UserRole role;
  final String? avatar;
  final String? studentId;
  final String? major;
  final String? className;
  final int? yearOfStudy;
  final String? phoneNumber;
  final String? address;
  final DateTime? dateOfBirth;
  final String? gender;

  Student({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.avatar,
    this.studentId,
    this.major,
    this.className,
    this.yearOfStudy,
    this.phoneNumber,
    this.address,
    this.dateOfBirth,
    this.gender,
  });

  // Tạo đối tượng Student từ JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      role: UserRole.values.firstWhere(
        (e) => e.toString() == 'UserRole.${json['role']}',
        orElse: () => UserRole.unknown,
      ),
      avatar: json['avatar'],
      studentId: json['studentId'],
      major: json['major'],
      className: json['className'],
      yearOfStudy: json['yearOfStudy'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth']) : null,
      gender: json['gender'],
    );
  }

  // Chuyển đổi đối tượng Student thành JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role.toString().split('.').last,
      'avatar': avatar,
      'studentId': studentId,
      'major': major,
      'className': className,
      'yearOfStudy': yearOfStudy,
      'phoneNumber': phoneNumber,
      'address': address,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'gender': gender,
    };
  }

  // Tạo bản sao của đối tượng Student với các thay đổi
  Student copyWith({
    String? id,
    String? email,
    String? name,
    UserRole? role,
    String? avatar,
    String? studentId,
    String? major,
    String? className,
    int? yearOfStudy,
    String? phoneNumber,
    String? address,
    DateTime? dateOfBirth,
    String? gender,
  }) {
    return Student(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,
      studentId: studentId ?? this.studentId,
      major: major ?? this.major,
      className: className ?? this.className,
      yearOfStudy: yearOfStudy ?? this.yearOfStudy,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
    );
  }
} 