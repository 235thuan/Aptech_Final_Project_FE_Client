import 'package:flutter/material.dart';
import '../../../core/services/api_service.dart';
import '../../widgets/common/custom_drawer.dart';

class UnifiedHomeScreen extends StatefulWidget {
  final String userRole;

  const UnifiedHomeScreen({
    super.key,
    required this.userRole,
  });

  @override
  State<UnifiedHomeScreen> createState() => _UnifiedHomeScreenState();
}

class _UnifiedHomeScreenState extends State<UnifiedHomeScreen> {
  int _currentIndex = 0;
  int _currentCarouselIndex = 0;
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  Map<String, dynamic> _dashboardData = {};

  // Cấu hình theo role
  late final Map<String, dynamic> _roleConfig = _getRoleConfig();

  Map<String, dynamic> _getRoleConfig() {
    switch (widget.userRole) {
      case 'STUDENT':
        return {
          'title': 'Trang chủ Sinh viên',
          'categories': [
            {
              'icon': Icons.school,
              'title': 'Khóa học',
              'color': Colors.blue,
              'route': '/courses',
            },
            {
              'icon': Icons.calendar_today,
              'title': 'Thời khóa biểu',
              'color': Colors.orange,
              'route': '/timetable',
            },
            {
              'icon': Icons.grade,
              'title': 'Điểm số',
              'color': Colors.green,
              'route': '/grades',
            },
            {
              'icon': Icons.payment,
              'title': 'Học phí',
              'color': Colors.purple,
              'route': '/payments',
            },
          ],
          'carouselItems': [
            {
              'image': 'assets/images/student/banner1.jpg',
              'title': 'Đăng ký học kỳ mới',
              'description': 'Hạn chót: 30/04/2024',
            },
            // Thêm các items khác
          ],
        };
      case 'TEACHER':
        return {
          'title': 'Trang chủ Giảng viên',
          'categories': [
            {
              'icon': Icons.class_,
              'title': 'Lớp học',
              'color': Colors.blue,
              'route': '/classes',
            },
            // Thêm các categories khác
          ],
        };
    // Thêm các role khác
      default:
        return {};
    }
  }

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  Future<void> _loadDashboardData() async {
    if (!mounted) return;

    setState(() => _isLoading = true);
    try {
      final data = await _apiService.getStudentDashboard();
      if (!mounted) return;

      setState(() {
        _dashboardData = data;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Không thể tải dữ liệu: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_roleConfig['title']),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      drawer: CustomDrawer(userRole: widget.userRole),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel using PageView
            SizedBox(
              height: 200, // You can adjust the height
              child: PageView.builder(
                itemCount: _roleConfig['carouselItems']?.length ?? 0,
                controller: PageController(viewportFraction: 1),
                onPageChanged: (index) {
                  setState(() {
                    _currentCarouselIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = _roleConfig['carouselItems'][index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['description'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Categories Grid
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: _roleConfig['categories']?.map<Widget>((category) {
                  return InkWell(
                    onTap: () {
                      // TODO: Navigate to category route
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: category['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: category['color'].withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            category['icon'],
                            size: 40,
                            color: category['color'],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category['title'],
                            style: TextStyle(
                              color: category['color'],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList() ?? [],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }
}
