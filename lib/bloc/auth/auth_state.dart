import 'package:equatable/equatable.dart';
import '../../core/models/student.dart';
import '../../core/enums/user_role.dart';

// Các trạng thái liên quan đến xác thực người dùng
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Trạng thái khởi tạo
class AuthInitial extends AuthState {}

// Trạng thái đang xử lý
class AuthLoading extends AuthState {}

// Trạng thái đã đăng nhập thành công
class AuthAuthenticated extends AuthState {
  final String userId;
  final String email;
  final UserRole role;
  final String name;
  final String? avatar;
  final Student student;

  const AuthAuthenticated({
    required this.userId,
    required this.email,
    required this.role,
    required this.name,
    this.avatar,
    required this.student,
  });

  @override
  List<Object?> get props => [userId, email, role, name, avatar, student];
}

// Trạng thái chưa đăng nhập
class AuthUnauthenticated extends AuthState {}

// Trạng thái lỗi
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

// Trạng thái đăng ký thành công
class AuthRegistered extends AuthState {
  final Student student;

  const AuthRegistered(this.student);

  @override
  List<Object> get props => [student];
}

// Trạng thái đổi mật khẩu thành công
class AuthPasswordChanged extends AuthState {}