import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/auth_service.dart';
import '../../core/models/student.dart';
import 'auth_event.dart';
import 'auth_state.dart';

// BLoC xử lý các sự kiện liên quan đến xác thực người dùng
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<RegisterEvent>(_onRegister);
    on<ChangePasswordEvent>(_onChangePassword);
  }

  // Kiểm tra trạng thái đăng nhập
  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // Emit trạng thái loading ngay khi bắt đầu kiểm tra
      emit(AuthLoading());
      
      final user = await _authService.getCurrentUser();
      if (user != null) {
        emit(AuthAuthenticated(
          userId: user.id,
          email: user.email,
          role: user.role,
          name: user.name,
          avatar: user.avatar,
          student: user,
        ));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError('Lỗi kiểm tra trạng thái đăng nhập: $e'));
    }
  }

  // Xử lý đăng nhập
  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final user = await _authService.login(event.email, event.password);
      emit(AuthAuthenticated(
        userId: user.id,
        email: user.email,
        role: user.role,
        name: user.name,
        avatar: user.avatar,
        student: user,
      ));
    } catch (e) {
      emit(AuthError('Lỗi đăng nhập: $e'));
    }
  }

  // Xử lý đăng xuất
  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      await _authService.logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError('Lỗi đăng xuất: $e'));
    }
  }

  // Xử lý đăng ký
  Future<void> _onRegister(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final user = await _authService.register(event.email, event.password, event.name);
      emit(AuthRegistered(user));
    } catch (e) {
      emit(AuthError('Lỗi đăng ký: $e'));
    }
  }

  // Xử lý đổi mật khẩu
  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      await _authService.changePassword(event.currentPassword, event.newPassword);
      emit(AuthPasswordChanged());
    } catch (e) {
      emit(AuthError('Lỗi đổi mật khẩu: $e'));
    }
  }
} 