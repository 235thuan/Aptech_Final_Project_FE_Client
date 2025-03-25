import 'package:flutter/material.dart';
import '../../widgets/admin/admin_drawer.dart';
import 'dashboard_screen.dart';
import 'user_management_screen.dart';
import 'course_management_screen.dart';
import 'system_settings_screen.dart';

// Màn hình chính cho admin
class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  // Danh sách các màn hình
  final List<Widget> _screens = [
    const DashboardScreen(),
    const UserManagementScreen(),
    const CourseManagementScreen(),
    const SystemSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản trị hệ thống'),
        actions: [
          // Nút thông báo
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
          // Nút tìm kiếm
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      drawer: const AdminDrawer(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // Cho phép hiển thị nhiều hơn 3 items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Tổng quan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Quản lý người dùng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Quản lý khóa học',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài đặt hệ thống',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement quick action
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 