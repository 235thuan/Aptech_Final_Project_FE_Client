import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';

// Widget cơ bản cho layout của các màn hình chính
class BaseHomeLayout extends StatefulWidget {
  final String title;
  final List<Widget> screens;
  final List<BottomNavigationBarItem> navigationItems;
  final Widget? floatingActionButton;

  const BaseHomeLayout({
    super.key,
    required this.title,
    required this.screens,
    required this.navigationItems,
    this.floatingActionButton,
  });

  @override
  State<BaseHomeLayout> createState() => _BaseHomeLayoutState();
}

class _BaseHomeLayoutState extends State<BaseHomeLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
          ),
        ],
      ),
      body: widget.screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: widget.navigationItems,
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }
} 