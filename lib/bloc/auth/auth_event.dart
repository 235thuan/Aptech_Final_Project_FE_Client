// Các sự kiện liên quan đến xác thực người dùng
abstract class AuthEvent {}

// Sự kiện đăng nhập
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

// Sự kiện đăng ký
class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}

// Sự kiện đăng xuất
class LogoutEvent extends AuthEvent {}

// Sự kiện đổi mật khẩu
class ChangePasswordEvent extends AuthEvent {
  final String currentPassword;
  final String newPassword;

  ChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
  });
}

// Sự kiện kiểm tra trạng thái đăng nhập
class CheckAuthStatusEvent extends AuthEvent {}