import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/services/dashboard_service.dart';

// Events
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class LoadDashboardData extends DashboardEvent {}

// States
abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final int totalStudents;
  final int totalTeachers;
  final int totalCourses;
  final int totalClasses;
  final int pendingFeedbacks;
  final double averageGrade;
  final List<Map<String, dynamic>> recentActivities;

  const DashboardLoaded({
    required this.totalStudents,
    required this.totalTeachers,
    required this.totalCourses,
    required this.totalClasses,
    required this.pendingFeedbacks,
    required this.averageGrade,
    required this.recentActivities,
  });

  @override
  List<Object?> get props => [totalStudents, totalTeachers, totalCourses, totalClasses, pendingFeedbacks, averageGrade, recentActivities];
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardService _dashboardService;

  DashboardBloc(this._dashboardService) : super(DashboardInitial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
  }

  Future<void> _onLoadDashboardData(
    LoadDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      emit(DashboardLoading());
      final dashboardData = await _dashboardService.getDashboardData();
      emit(DashboardLoaded(
        totalStudents: dashboardData['totalStudents'],
        totalTeachers: dashboardData['totalTeachers'],
        totalCourses: dashboardData['totalCourses'],
        totalClasses: dashboardData['totalClasses'],
        pendingFeedbacks: dashboardData['pendingFeedbacks'],
        averageGrade: dashboardData['averageGrade'],
        recentActivities: dashboardData['recentActivities'],
      ));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
} 