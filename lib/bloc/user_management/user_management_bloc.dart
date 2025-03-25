import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/user.dart';
import '../../core/services/user_management_service.dart';

// Events
abstract class UserManagementEvent extends Equatable {
  const UserManagementEvent();

  @override
  List<Object?> get props => [];
}

class LoadUsers extends UserManagementEvent {}

class AddUser extends UserManagementEvent {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String role;
  final String status;

  const AddUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
    required this.status,
  });

  @override
  List<Object?> get props => [name, email, phone, address, role, status];
}

class UpdateUser extends UserManagementEvent {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String role;
  final String status;

  const UpdateUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
    required this.status,
  });

  @override
  List<Object?> get props => [id, name, email, phone, address, role, status];
}

class DeleteUser extends UserManagementEvent {
  final String id;

  const DeleteUser(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class UserManagementState extends Equatable {
  const UserManagementState();

  @override
  List<Object?> get props => [];
}

class UserManagementInitial extends UserManagementState {}

class UserManagementLoading extends UserManagementState {}

class UserManagementLoaded extends UserManagementState {
  final List<User> users;

  const UserManagementLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class UserManagementError extends UserManagementState {
  final String message;

  const UserManagementError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class UserManagementBloc extends Bloc<UserManagementEvent, UserManagementState> {
  final UserManagementService _userManagementService;

  UserManagementBloc(this._userManagementService) : super(UserManagementInitial()) {
    on<LoadUsers>(_onLoadUsers);
    on<AddUser>(_onAddUser);
    on<UpdateUser>(_onUpdateUser);
    on<DeleteUser>(_onDeleteUser);
  }

  Future<void> _onLoadUsers(
    LoadUsers event,
    Emitter<UserManagementState> emit,
  ) async {
    try {
      emit(UserManagementLoading());
      final users = await _userManagementService.getUsers();
      emit(UserManagementLoaded(users));
    } catch (e) {
      emit(UserManagementError(e.toString()));
    }
  }

  Future<void> _onAddUser(
    AddUser event,
    Emitter<UserManagementState> emit,
  ) async {
    try {
      emit(UserManagementLoading());
      await _userManagementService.addUser(
        name: event.name,
        email: event.email,
        phone: event.phone,
        address: event.address,
        role: event.role,
        status: event.status,
      );
      final users = await _userManagementService.getUsers();
      emit(UserManagementLoaded(users));
    } catch (e) {
      emit(UserManagementError(e.toString()));
    }
  }

  Future<void> _onUpdateUser(
    UpdateUser event,
    Emitter<UserManagementState> emit,
  ) async {
    try {
      emit(UserManagementLoading());
      await _userManagementService.updateUser(
        id: event.id,
        name: event.name,
        email: event.email,
        phone: event.phone,
        address: event.address,
        role: event.role,
        status: event.status,
      );
      final users = await _userManagementService.getUsers();
      emit(UserManagementLoaded(users));
    } catch (e) {
      emit(UserManagementError(e.toString()));
    }
  }

  Future<void> _onDeleteUser(
    DeleteUser event,
    Emitter<UserManagementState> emit,
  ) async {
    try {
      emit(UserManagementLoading());
      await _userManagementService.deleteUser(event.id);
      final users = await _userManagementService.getUsers();
      emit(UserManagementLoaded(users));
    } catch (e) {
      emit(UserManagementError(e.toString()));
    }
  }
} 