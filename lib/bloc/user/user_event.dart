// Các sự kiện liên quan đến thông tin người dùng
abstract class UserEvent {}

// Sự kiện cập nhật thông tin cá nhân
class UpdateProfileEvent extends UserEvent {
  final String studentId;
  final Map<String, dynamic> data;

  UpdateProfileEvent({
    required this.studentId,
    required this.data,
  });
}

// Sự kiện tải lên ảnh đại diện
class UploadAvatarEvent extends UserEvent {
  final String studentId;
  final String imagePath;

  UploadAvatarEvent({
    required this.studentId,
    required this.imagePath,
  });
}

// Sự kiện lấy thông tin chi tiết sinh viên
class GetStudentDetailsEvent extends UserEvent {
  final String studentId;

  GetStudentDetailsEvent(this.studentId);
}

// Sự kiện cập nhật mật khẩu
class UpdatePasswordEvent extends UserEvent {
  final String studentId;
  final String oldPassword;
  final String newPassword;

  UpdatePasswordEvent({
    required this.studentId,
    required this.oldPassword,
    required this.newPassword,
  });
} 