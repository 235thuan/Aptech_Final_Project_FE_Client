import '../models/student.dart';
import '../enums/user_role.dart';

// Service cung cấp dữ liệu mẫu cho testing
class MockDataService {
  // Lấy dữ liệu mẫu cho sinh viên
  static Student getMockStudent() {
    return Student(
      id: '1',
      email: 'student@example.com',
      name: 'Nguyễn Văn A',
      role: UserRole.student,
      studentId: 'ST001',
      major: 'Công nghệ thông tin',
      className: 'IT101',
      yearOfStudy: 1,
      phoneNumber: '0123456789',
      address: 'Hà Nội',
      dateOfBirth: DateTime(2000, 1, 1),
      gender: 'Nam',
    );
  }

  // Lấy dữ liệu mẫu cho giảng viên
  static Student getMockTeacher() {
    return Student(
      id: '2',
      email: 'teacher@example.com',
      name: 'Trần Thị B',
      role: UserRole.teacher,
      major: 'Công nghệ thông tin',
      phoneNumber: '0987654321',
      address: 'Hồ Chí Minh',
      dateOfBirth: DateTime(1980, 1, 1),
      gender: 'Nữ',
    );
  }

  // Lấy dữ liệu mẫu cho giáo vụ
  static Student getMockAdmin() {
    return Student(
      id: '3',
      email: 'admin@example.com',
      name: 'Lê Văn C',
      role: UserRole.admin,
      phoneNumber: '0369852147',
      address: 'Đà Nẵng',
      dateOfBirth: DateTime(1970, 1, 1),
      gender: 'Nam',
    );
  }

  // Lấy dữ liệu mẫu cho phụ huynh
  static Student getMockParent() {
    return Student(
      id: '4',
      email: 'parent@example.com',
      name: 'Phạm Thị D',
      role: UserRole.parent,
      phoneNumber: '0147852369',
      address: 'Hải Phòng',
      dateOfBirth: DateTime(1975, 1, 1),
      gender: 'Nữ',
    );
  }
} 