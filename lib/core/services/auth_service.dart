import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/student.dart';
import '../enums/user_role.dart';


// Service xử lý xác thực người dùng
class AuthService {
  // Kiểm tra trạng thái xác thực
  Future<void> checkAuthStatus() async {
    try {
      // TODO: Kiểm tra token trong local storage
      // Tạm thời trả về trạng thái chưa xác thực
      return;
    } catch (e) {
      print('Lỗi kiểm tra trạng thái xác thực: $e');
      rethrow;
    }
  }

  // Đăng nhập
  Future<Student> login(String email, String password) async {
    try {
      // TODO: Gọi API đăng nhập
      // Tạm thời trả về dữ liệu mẫu
      if (email == 'student@example.com' && password == 'password123') {
        return Student(
          id: '1',
          email: email,
          name: 'Nguyễn Văn A',
          role: UserRole.student,
          studentId: 'ST001',
          major: 'Công nghệ thông tin',
          className: 'CNTT1',
          yearOfStudy: 1,
          phoneNumber: '0123456789',
          address: 'Hà Nội',
          dateOfBirth: DateTime(2000, 1, 1),
          gender: 'Nam',
        );
      } else if (email == 'teacher@example.com' && password == 'password123') {
        return Student(
          id: '2',
          email: email,
          name: 'Trần Thị B',
          role: UserRole.teacher,
          studentId: 'GV001',
          major: 'Toán học',
          className: 'Toán1',
          yearOfStudy: 1,
          phoneNumber: '0987654321',
          address: 'Hồ Chí Minh',
          dateOfBirth: DateTime(1985, 1, 1),
          gender: 'Nữ',
        );
      } else if (email == 'admin@example.com' && password == 'password123') {
        return Student(
          id: '3',
          email: email,
          name: 'Lê Văn C',
          role: UserRole.admin,
          studentId: 'AD001',
          major: 'Quản trị hệ thống',
          className: 'Admin1',
          yearOfStudy: 1,
          phoneNumber: '0369852147',
          address: 'Đà Nẵng',
          dateOfBirth: DateTime(1990, 1, 1),
          gender: 'Nam',
        );
      } else if (email == 'parent@example.com' && password == 'password123') {
        return Student(
          id: '4',
          email: email,
          name: 'Phạm Thị D',
          role: UserRole.parent,
          studentId: 'PH001',
          major: 'Phụ huynh',
          className: 'Parent1',
          yearOfStudy: 1,
          phoneNumber: '0147852369',
          address: 'Hải Phòng',
          dateOfBirth: DateTime(1975, 1, 1),
          gender: 'Nữ',
        );
      }
      throw Exception('Email hoặc mật khẩu không đúng');
    } catch (e) {
      print('Lỗi đăng nhập: $e');
      rethrow;
    }
  }

  // Đăng ký
  Future<Student> register(String email, String password, String name) async {
    try {
      // TODO: Gọi API đăng ký
      // Tạm thời trả về dữ liệu mẫu
      return Student(
        id: '1',
        email: email,
        name: name,
        role: UserRole.student,
        studentId: 'ST001',
        major: 'Công nghệ thông tin',
        className: 'CNTT1',
        yearOfStudy: 1,
        phoneNumber: '0123456789',
        address: 'Hà Nội',
        dateOfBirth: DateTime(2000, 1, 1),
        gender: 'Nam',
      );
    } catch (e) {
      print('Lỗi đăng ký: $e');
      rethrow;
    }
  }

  // Đăng xuất
  Future<void> logout() async {
    try {
      // TODO: Xóa token và dữ liệu người dùng
      return;
    } catch (e) {
      print('Lỗi đăng xuất: $e');
      rethrow;
    }
  }

  // Đổi mật khẩu
  Future<void> changePassword(String currentPassword, String newPassword) async {
    try {
      // TODO: Gọi API đổi mật khẩu
      return;
    } catch (e) {
      print('Lỗi đổi mật khẩu: $e');
      rethrow;
    }
  }

  // Lấy thông tin người dùng hiện tại
  Future<Student?> getCurrentUser() async {
    try {
      // Thêm delay 2 giây để hiển thị SplashScreen animation
      await Future.delayed(const Duration(seconds: 2));
      
      // TODO: Lấy thông tin từ local storage hoặc API
      // Tạm thời trả về null để yêu cầu đăng nhập
      return null;
    } catch (e) {
      print('Lỗi lấy thông tin người dùng: $e');
      return null;
    }
  }
}