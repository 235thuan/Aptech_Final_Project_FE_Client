import 'package:flutter/material.dart';
import '../../core/enums/user_role.dart';
// import '../../ui/screens/admin/admin_home_screen_v2.dart';
import '../../ui/screens/home/unified_home_screen.dart';
import '../../ui/screens/admin/admin_home_screen_v2.dart';
import '../../ui/screens/teacher/teacher_home_screen.dart';
import '../../ui/screens/student/student_home_screen.dart';
import '../../ui/screens/parent/parent_home_screen.dart';

// Service xử lý điều hướng dựa trên vai trò người dùng
class NavigationService {
  // Lấy màn hình chính dựa trên vai trò người dùng
  static Widget getHomeScreenByRole(UserRole role) {
    switch (role) {
      case UserRole.admin:
        // return const AdminHomeScreen();
        //  return const HomeScreen();
         return const UnifiedHomeScreen(userRole: 'Admin',);
      case UserRole.teacher:
        return const TeacherHomeScreen();
      case UserRole.student:
        return const StudentHomeScreen();
      case UserRole.parent:
        return const ParentHomeScreen();
      default:
        return const Scaffold(
          body: Center(
            child: Text('Vai trò không hợp lệ'),
          ),
        );
    }
  }

  // Kiểm tra quyền truy cập
  static bool hasAccess(UserRole role, String feature) {
    switch (role) {
      case UserRole.admin:
        return true; // Admin có quyền truy cập tất cả
      case UserRole.teacher:
        return [
          'view_students',
          'manage_grades',
          'manage_assignments',
          'view_schedule',
          'manage_attendance',
        ].contains(feature);
      case UserRole.student:
        return [
          'view_grades',
          'view_schedule',
          'view_assignments',
          'view_attendance',
        ].contains(feature);
      case UserRole.parent:
        return [
          'view_child_grades',
          'view_child_schedule',
          'view_child_attendance',
          'view_child_assignments',
        ].contains(feature);
      case UserRole.unknown:
        return false;
    }
  }
} 