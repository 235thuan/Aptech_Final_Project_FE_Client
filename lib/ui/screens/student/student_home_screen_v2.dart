import 'package:flutter/material.dart';
import '../../widgets/student/student_drawer.dart'; // Sẽ tạo file này sau
import '../course_registration_screen.dart';
import '../timetable_screen.dart';
import '../grade_screen.dart';
import '../profile_screen.dart';
import '../feed_screen.dart';

class StudentHomeScreenV2 extends StatefulWidget {
  const StudentHomeScreenV2({super.key});

  @override
  State<StudentHomeScreenV2> createState() => _StudentHomeScreenV2State();
}

class _StudentHomeScreenV2State extends State<StudentHomeScreenV2> {
  int _currentIndex = 0;
  int _currentCarouselIndex = 0;

  // Danh sách items cho Carousel
  final List<Map<String, dynamic>> _carouselItems = [
    {
      'image': 'assets/images/event1.jpg',
      'title': 'Tuần lễ định hướng 2024',
      'description': 'Chào đón tân sinh viên khóa 2024',
      'gradient': [Colors.blue.shade400, Colors.blue.shade900],
    },
    {
      'image': 'assets/images/event2.jpg',
      'title': 'Hội thảo CNTT',
      'description': 'Xu hướng công nghệ AI trong giáo dục',
      'gradient': [Colors.orange.shade400, Colors.orange.shade900],
    },
    {
      'image': 'assets/images/event3.jpg',
      'title': 'Ngày hội việc làm IT',
      'description': 'Cơ hội việc làm cho sinh viên CNTT',
      'gradient': [Colors.green.shade400, Colors.green.shade900],
    },
  ];

  // Danh sách các danh mục
  final List<Map<String, dynamic>> _categories = [
    {
      'icon': Icons.event,
      'title': 'Sự kiện',
      'color': Colors.orange,
      'count': '5 sự kiện mới',
    },
    {
      'icon': Icons.school,
      'title': 'Khóa học',
      'color': Colors.blue,
      'count': '12 khóa học',
    },
    {
      'icon': Icons.person,
      'title': 'Giảng viên',
      'color': Colors.purple,
      'count': '25 giảng viên',
    },
    {
      'icon': Icons.people,
      'title': 'Cộng đồng',
      'color': Colors.green,
      'count': '100+ bài viết',
    },
  ];

  // Widget hiển thị trang chủ
  Widget _buildHomeScreen() {
    return ListView(
      children: [
        // Carousel/Slider
        AspectRatio(
          aspectRatio: 16/9,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: _carouselItems.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentCarouselIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = _carouselItems[index];
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: item['gradient'],
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['description'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Indicators
              Positioned(
                bottom: 20,
                right: 20,
                child: Row(
                  children: List.generate(
                    _carouselItems.length,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentCarouselIndex == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Categories Grid
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Danh mục',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        // TODO: Navigate to category screen
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              category['color'].withOpacity(0.1),
                              category['color'].withOpacity(0.2),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              category['icon'],
                              size: 32,
                              color: category['color'],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              category['count'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Danh sách các màn hình chính
    final List<Widget> screens = [
      _buildHomeScreen(),
      const CourseRegistrationScreen(),
      const TimetableScreen(),
      const GradeScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ Sinh viên'),
        actions: [
          // Nút tìm kiếm
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          // Nút thông báo
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      drawer: const StudentDrawer(), // Sử dụng StudentDrawer
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
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