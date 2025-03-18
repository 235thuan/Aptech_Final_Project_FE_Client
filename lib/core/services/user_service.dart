import 'package:flutter/foundation.dart';
import '../models/student.dart';
import '../enums/user_role.dart';

// Service xử lý các thao tác liên quan đến thông tin người dùng
class UserService {
  // Cập nhật thông tin cá nhân
  Future<Student> updateProfile(String studentId, Map<String, dynamic> data) async {
    try {
      // TODO: Implement API call to update profile
      // Đây là nơi sẽ gọi API cập nhật thông tin
      // Tạm thời trả về dữ liệu mẫu để test
      return Student(
        id: studentId,
        email: data['email'] ?? 'test@example.com',
        name: data['name'] ?? 'Test User',
        role: UserRole.student,
        studentId: data['studentId'] ?? 'ST001',
        major: data['major'] ?? 'Computer Science',
        className: data['className'] ?? 'CS101',
        yearOfStudy: data['yearOfStudy'] ?? 1,
        phoneNumber: data['phoneNumber'] ?? '0123456789',
        address: data['address'] ?? 'Test Address',
        dateOfBirth: data['dateOfBirth'] != null ? DateTime.parse(data['dateOfBirth']) : DateTime(2000, 1, 1),
        gender: data['gender'] ?? 'Nam',
      );
    } catch (e) {
      debugPrint('Lỗi cập nhật thông tin: $e');
      rethrow;
    }
  }

  // Tải lên ảnh đại diện
  Future<String> uploadAvatar(String studentId, String imagePath) async {
    try {
      // TODO: Implement API call to upload avatar
      // Đây là nơi sẽ gọi API tải lên ảnh
      // Tạm thời trả về URL mẫu để test
      return 'https://example.com/avatar.jpg';
    } catch (e) {
      debugPrint('Lỗi tải lên ảnh: $e');
      rethrow;
    }
  }

  // Lấy thông tin chi tiết sinh viên
  Future<Student> getStudentDetails(String studentId) async {
    try {
      // TODO: Implement API call to get student details
      // Đây là nơi sẽ gọi API lấy thông tin chi tiết
      // Tạm thời trả về dữ liệu mẫu để test
      return Student(
        id: studentId,
        email: 'test@example.com',
        name: 'Test User',
        role: UserRole.student,
        studentId: 'ST001',
        major: 'Computer Science',
        className: 'CS101',
        yearOfStudy: 1,
        phoneNumber: '0123456789',
        address: 'Test Address',
        dateOfBirth: DateTime(2000, 1, 1),
        gender: 'Nam',
      );
    } catch (e) {
      debugPrint('Lỗi lấy thông tin chi tiết: $e');
      rethrow;
    }
  }

  // Cập nhật mật khẩu
  Future<bool> updatePassword(String studentId, String oldPassword, String newPassword) async {
    try {
      // TODO: Implement API call to update password
      // Đây là nơi sẽ gọi API cập nhật mật khẩu
      // Tạm thời trả về true để test
      return true;
    } catch (e) {
      debugPrint('Lỗi cập nhật mật khẩu: $e');
      rethrow;
    }
  }
}