import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/user_service.dart';
import 'user_event.dart';
import 'user_state.dart';

// BLoC xử lý logic liên quan đến thông tin người dùng
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;

  UserBloc(this._userService) : super(UserInitial()) {
    // Xử lý sự kiện cập nhật thông tin cá nhân
    on<UpdateProfileEvent>((event, emit) async {
      try {
        emit(UserLoading());
        final updatedStudent = await _userService.updateProfile(
          event.studentId,
          event.data,
        );
        emit(ProfileUpdated(updatedStudent));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    // Xử lý sự kiện tải lên ảnh đại diện
    on<UploadAvatarEvent>((event, emit) async {
      try {
        emit(UserLoading());
        final avatarUrl = await _userService.uploadAvatar(
          event.studentId,
          event.imagePath,
        );
        emit(AvatarUploaded(avatarUrl));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    // Xử lý sự kiện lấy thông tin chi tiết sinh viên
    on<GetStudentDetailsEvent>((event, emit) async {
      try {
        emit(UserLoading());
        final student = await _userService.getStudentDetails(event.studentId);
        emit(StudentDetailsLoaded(student));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    // Xử lý sự kiện cập nhật mật khẩu
    on<UpdatePasswordEvent>((event, emit) async {
      try {
        emit(UserLoading());
        final success = await _userService.updatePassword(
          event.studentId,
          event.oldPassword,
          event.newPassword,
        );
        if (success) {
          emit(PasswordUpdated());
        } else {
          emit(UserError('Cập nhật mật khẩu thất bại'));
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
} 