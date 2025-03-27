import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/course/course_bloc.dart';
import '../../bloc/course/course_event.dart';
import '../../bloc/course/course_state.dart';
import '../../core/models/course.dart';
import '../../core/services/mock_data_service.dart';
import 'package:intl/intl.dart';

// Màn hình đăng ký môn học
class CourseRegistrationScreen extends StatefulWidget {
  const CourseRegistrationScreen({super.key});

  @override
  State<CourseRegistrationScreen> createState() => _CourseRegistrationScreenState();
}

class _CourseRegistrationScreenState extends State<CourseRegistrationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadCourses();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _loadCourses() {
    // Sử dụng mock data thay vì gọi API
    MockDataService.getMockCourses();
    context.read<CourseBloc>().add(GetAvailableCoursesEvent());
    context.read<CourseBloc>().add(GetRegisteredCoursesEvent('1')); // Using mock student ID
  }

  void _registerCourse(String studentId, Course course) {
    context.read<CourseBloc>().add(RegisterCourseEvent(
      studentId: studentId,
      courseId: course.id,
    ));
  }

  void _cancelRegistration(String studentId, Course course) {
    context.read<CourseBloc>().add(CancelRegistrationEvent(
      studentId: studentId,
      courseId: course.id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng ký môn học'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Môn học có thể đăng ký'),
            Tab(text: 'Môn học đã đăng ký'),
          ],
        ),
      ),
      body: BlocListener<CourseBloc, CourseState>(
        listener: (context, state) {
          if (state is CourseError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Tìm kiếm môn học',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // TODO: Implement search functionality
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Tab môn học có thể đăng ký
                  BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is AvailableCoursesLoaded) {
                        return _buildCourseList(
                          state.courses,
                          isRegistered: false,
                        );
                      }
                      return const Center(child: Text('Không có môn học nào'));
                    },
                  ),
                  // Tab môn học đã đăng ký
                  BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is RegisteredCoursesLoaded) {
                        return _buildCourseList(
                          state.courses,
                          isRegistered: true,
                        );
                      }
                      return const Center(
                          child: Text('Chưa đăng ký môn học nào'));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList(List<Course> courses, {required bool isRegistered}) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ExpansionTile(
            title: Text(course.name),
            subtitle: Text(course.code),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mô tả: ${course.description}'),
                    const SizedBox(height: 8),
                    Text('Giảng viên: ${course.instructor}'),
                    const SizedBox(height: 8),
                    Text('Số tín chỉ: ${course.credits}'),
                    const SizedBox(height: 8),
                    Text(
                        'Thời gian: ${DateFormat('dd/MM/yyyy').format(course.startDate)} - ${DateFormat('dd/MM/yyyy').format(course.endDate)}'),
                    const SizedBox(height: 8),
                    Text('Địa điểm: ${course.location}'),
                    const SizedBox(height: 8),
                    Text(
                        'Số lượng: ${course.currentStudents}/${course.maxStudents}'),
                    const SizedBox(height: 8),
                    Text('Học phí: ${NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(course.price)}'),
                    const SizedBox(height: 16),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthAuthenticated) {
                          return ElevatedButton(
                            onPressed: course.status == 'full'
                                ? null
                                : () {
                                    if (isRegistered) {
                                      _cancelRegistration(
                                          state.student.id, course);
                                    } else {
                                      _registerCourse(state.student.id, course);
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isRegistered
                                  ? Colors.red
                                  : Theme.of(context).primaryColor,
                              minimumSize: const Size(double.infinity, 36),
                            ),
                            child: Text(
                              isRegistered ? 'Hủy đăng ký' : 'Đăng ký',
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 