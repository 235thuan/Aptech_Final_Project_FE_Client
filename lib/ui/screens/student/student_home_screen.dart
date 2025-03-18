import 'package:flutter/material.dart';
import '../../widgets/base_home_layout.dart';
import '../course_registration_screen.dart';
import '../timetable_screen.dart';
import '../grade_screen.dart';
import '../profile_screen.dart';
import '../feed_screen.dart';

// Màn hình chính cho sinh viên
class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHomeLayout(
      title: 'Trang chủ Sinh viên',
      screens: const [
        FeedScreen(),
        CourseRegistrationScreen(),
        TimetableScreen(),
        GradeScreen(),
        ProfileScreen(),
      ],
      navigationItems: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Đăng ký môn học',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Thời khóa biểu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grade),
          label: 'Điểm số',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Hồ sơ',
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement notifications
        },
        child: const Icon(Icons.notifications),
      ),
    );
  }
} 