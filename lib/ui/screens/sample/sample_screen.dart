import 'package:flutter/material.dart';

import '../../layouts/sample_layout.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  int _currentIndex = 0;
  int _currentCarouselIndex = 0;

  // Danh sách các danh mục giáo dục
  final List<Map<String, dynamic>> _categories = [
    {
      'icon': Icons.school,
      'title': 'Khóa học',
      'color': Colors.blue,
    },
    {
      'icon': Icons.book,
      'title': 'Tài liệu',
      'color': Colors.green,
    },
    {
      'icon': Icons.event,
      'title': 'Sự kiện',
      'color': Colors.orange,
    },
    {
      'icon': Icons.people,
      'title': 'Cộng đồng',
      'color': Colors.purple,
    },
  ];

  // Danh sách menu items cho Hamburger Menu
  final List<Map<String, dynamic>> _menuItems = [
    {
      'icon': Icons.home,
      'title': 'Trang Chủ',
      'subtitle': 'Chào mừng đến với trường XYZ',
    },
    {
      'icon': Icons.school,
      'title': 'Khóa Học',
      'subtitle': 'Danh sách các khóa học hiện có',
    },
    {
      'icon': Icons.calendar_today,
      'title': 'Thời Khóa Biểu',
      'subtitle': 'Xem lịch học của bạn theo tuần',
    },
    {
      'icon': Icons.person,
      'title': 'Giảng Viên',
      'subtitle': 'Thông tin chi tiết về các giảng viên',
    },
    {
      'icon': Icons.notifications,
      'title': 'Thông Báo',
      'subtitle': 'Tin tức và thông báo mới nhất',
    },
    {
      'icon': Icons.contact_phone,
      'title': 'Liên Hệ',
      'subtitle': 'Thông tin liên hệ của trường',
    },
  ];

  // Danh sách items cho Carousel
  final List<Map<String, dynamic>> _carouselItems = [
    {
      'image': 'assets/images/graduation.jpg',
      'title': 'Lễ tốt nghiệp 2024',
      'description': 'Sự kiện tốt nghiệp lớn nhất trong năm',
      'gradient': [Colors.blue.shade400, Colors.blue.shade900],
    },
    {
      'image': 'assets/images/tech_seminar.jpg',
      'title': 'Hội thảo Công nghệ',
      'description': 'Cập nhật xu hướng công nghệ mới nhất',
      'gradient': [Colors.orange.shade400, Colors.orange.shade900],
    },
    {
      'image': 'assets/images/job_fair.jpg',
      'title': 'Ngày hội việc làm',
      'description': 'Cơ hội việc làm cho sinh viên',
      'gradient': [Colors.green.shade400, Colors.green.shade900],
    },
  ];

  // Danh sách cards
  final List<Map<String, dynamic>> _cards = [
    {
      'title': 'Toán Cao Cấp',
      'image': Icons.functions,
      'description': 'Cung cấp kiến thức vững vàng về toán học ứng dụng',
      'color': Colors.blue.shade100,
      'iconColor': Colors.blue.shade700,
      'tag': 'Khoa học cơ bản',
    },
    {
      'title': 'GV. Nguyễn Văn A',
      'image': Icons.person,
      'description': 'Giảng viên bộ môn Công nghệ phần mềm',
      'color': Colors.green.shade100,
      'iconColor': Colors.green.shade700,
      'tag': 'Giảng viên',
    },
    {
      'title': 'Hội thảo Khoa học',
      'image': Icons.event,
      'description': 'Diễn ra vào ngày 15/04/2024 tại Hội trường A',
      'color': Colors.orange.shade100,
      'iconColor': Colors.orange.shade700,
      'tag': 'Sự kiện',
    },
    {
      'title': 'Seminar AI',
      'image': Icons.psychology,
      'description': 'Ứng dụng AI trong giáo dục hiện đại',
      'color': Colors.purple.shade100,
      'iconColor': Colors.purple.shade700,
      'tag': 'Công nghệ',
    },
  ];

  // Widget hiển thị feed các danh mục
  Widget _buildCategoryFeed() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Carousel/Slider với thiết kế mới
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
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: item['gradient'],
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
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
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['description'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Thêm indicators cho carousel
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

        const SizedBox(height: 32),

        // Sự kiện sắp tới với thiết kế mới
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sự kiện sắp tới',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            TextButton(
              onPressed: () {
                // Xử lý khi nhấn xem tất cả
              },
              child: const Text('Xem tất cả'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
          children: _cards.map((card) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color: card['color'],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        card['image'],
                        size: 56,
                        color: card['iconColor'],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: card['color'],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            card['tag'],
                            style: TextStyle(
                              color: card['iconColor'],
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          card['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          card['description'],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            height: 1.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 32),

        // Feed với thiết kế mới
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Bài viết mới nhất',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            TextButton(
              onPressed: () {
                // Xử lý khi nhấn xem tất cả
              },
              child: const Text('Xem tất cả'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
          children: List.generate(4, (index) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/post_${index + 1}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage(
                                'assets/images/avatar_${index + 1}.jpg',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Tác giả ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Bài viết ${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Mô tả ngắn về bài viết ${index + 1} với nội dung hấp dẫn',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            height: 1.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.thumb_up,
                                size: 16, color: Colors.blue.shade700),
                            const SizedBox(width: 4),
                            Text(
                              '${10 + index}',
                              style: TextStyle(
                                color: Colors.blue.shade700,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(Icons.comment,
                                size: 16, color: Colors.grey.shade700),
                            const SizedBox(width: 4),
                            Text(
                              '${5 + index}',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SampleLayout(
        title: 'Trang chủ Mẫu',
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        screens: [
          _buildCategoryFeed(),
          const Center(child: Text('Trang Khóa học')),
          const Center(child: Text('Trang Lịch học')),
          const Center(child: Text('Trang Cá nhân')),
        ],
        navigationItems: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Khóa học',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Lịch học',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cá nhân',
          ),
        ],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Xử lý khi nhấn nút thông báo
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.notifications),
        ),
      ),
    );
  }
} 