import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';
import '../../screens/parent/child_info_screen.dart';
import '../../screens/parent/child_grades_screen.dart';
import '../../screens/parent/child_schedule_screen.dart';
import '../../screens/parent/exam_schedule_screen.dart';
import '../../screens/parent/payment_screen.dart';
import '../../screens/parent/notification_screen.dart';
import '../../screens/parent/child_activities_screen.dart';
import '../../screens/parent/feedback_screen.dart';

// Màn hình chính cho phụ huynh
class ParentHomeScreen extends StatefulWidget {
  const ParentHomeScreen({super.key});

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
  int _selectedIndex = 0;

  // Danh sách các màn hình cho phụ huynh
  final List<Widget> _screens = [
    const ChildInfoScreen(),
    const ChildGradesScreen(),
    const ChildScheduleScreen(),
    const ExamScheduleScreen(),
    const PaymentScreen(),
    const NotificationScreen(),
    const ChildActivitiesScreen(),
    const FeedbackScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý phụ huynh'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Thông tin con',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grade),
              label: 'Điểm số',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Lịch học',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Lịch thi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Học phí',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Thông báo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Hoạt động',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feedback),
              label: 'Phản hồi',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement quick actions
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 