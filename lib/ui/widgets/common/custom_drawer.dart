import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String userRole;

  const CustomDrawer({
    super.key,
    required this.userRole,
  });

  List<Map<String, dynamic>> _getMenuItems() {
    switch (userRole) {
      case 'STUDENT':
        return [
          {
            'icon': Icons.school,
            'title': 'Khóa học',
            'route': '/courses',
          },
          {
            'icon': Icons.calendar_today,
            'title': 'Thời khóa biểu',
            'route': '/timetable',
          },
          // Thêm các menu items khác
        ];
      // Thêm các role khác
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = _getMenuItems();
    
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            accountName: const Text('Nguyễn Văn A'),
            accountEmail: Text('Role: $userRole'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return ListTile(
                  leading: Icon(item['icon']),
                  title: Text(item['title']),
                  onTap: () {
                    Navigator.pushNamed(context, item['route']);
                  },
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Đăng xuất'),
            onTap: () {
              // TODO: Implement logout
            },
          ),
        ],
      ),
    );
  }
} 