import '../../core/models/student.dart';

// Các trạng thái liên quan đến thông tin người dùng
abstract class UserState {}

// Trạng thái khởi tạo
class UserInitial extends UserState {}

// Trạng thái đang xử lý
class UserLoading extends UserState {}

// Trạng thái cập nhật thông tin thành công
class ProfileUpdated extends UserState {
  final Student student;

  ProfileUpdated(this.student);
}

// Trạng thái tải lên ảnh thành công
class AvatarUploaded extends UserState {
  final String avatarUrl;

  AvatarUploaded(this.avatarUrl);
}

// Trạng thái lấy thông tin chi tiết thành công
class StudentDetailsLoaded extends UserState {
  final Student student;

  StudentDetailsLoaded(this.student);
}

// Trạng thái cập nhật mật khẩu thành công
class PasswordUpdated extends UserState {}

// Trạng thái lỗi
class UserError extends UserState {
  final String message;

  UserError(this.message);
} 