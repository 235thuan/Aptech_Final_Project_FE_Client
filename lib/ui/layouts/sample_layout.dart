import 'package:flutter/material.dart';

class SampleLayout extends StatelessWidget {
  final String title;
  final List<Widget> screens;
  final List<BottomNavigationBarItem> navigationItems;
  final Widget? floatingActionButton;
  final int currentIndex;
  final Function(int)? onTap;

  const SampleLayout({
    super.key,
    required this.title,
    required this.screens,
    required this.navigationItems,
    this.floatingActionButton,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Tạo layout với header, content và bottom navigation
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Xử lý mở drawer menu
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Xử lý tìm kiếm
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Xử lý thông báo
            },
          ),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items: navigationItems,
      ),
      floatingActionButton: floatingActionButton,
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Người dùng mẫu"),
              accountEmail: Text("user@example.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Trang chủ"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // Thêm các menu item khác
          ],
        ),
      ),
    );
  }
} 