import '../models/user.dart';
import 'mock_data_service.dart';

class ProfileService {
  // Lấy thông tin profile
  Future<User> getProfile() async {
    try {
      // TODO: Implement API call
      final student = MockDataService.getMockStudent();
      return User(
        id: student.id,
        name: student.name,
        email: student.email,
        phone: student.phoneNumber ?? '',
        address: student.address ?? '',
        role: student.role.toString().split('.').last,
        status: 'active',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      );
    } catch (e) {
      throw Exception('Failed to load profile: $e');
    }
  }

  // Cập nhật thông tin profile
  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String address,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  // Đổi mật khẩu
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to change password: $e');
    }
  }
} 