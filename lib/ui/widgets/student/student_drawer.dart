import 'package:flutter/material.dart';
import '../../screens/feed_screen.dart';
import '../../screens/course_registration_screen.dart';
import '../../screens/timetable_screen.dart';
import '../../screens/grade_screen.dart';
import '../../screens/profile_screen.dart';
// Import các màn hình khác nếu cần

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header của drawer
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/student_avatar.jpg'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Nguyễn Văn A',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'MSSV: 123456789',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          // Các mục menu
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Trang chủ'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FeedScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Đăng ký môn học'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CourseRegistrationScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Thời khóa biểu'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TimetableScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.grade),
            title: const Text('Điểm số'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const GradeScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Tài liệu học tập'),
            onTap: () {
              // TODO: Navigate to Documents screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Học phí'),
            onTap: () {
              // TODO: Navigate to Tuition screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Phản hồi'),
            onTap: () {
              // TODO: Navigate to Feedback screen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Thông tin cá nhân'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Đăng xuất'),
            onTap: () {
              // TODO: Implement logout functionality
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
} 