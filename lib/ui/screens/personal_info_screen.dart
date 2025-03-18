import 'package:flutter/material.dart';

// Màn hình thông tin cá nhân
class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Ảnh đại diện và tên
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/200/200',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Nguyễn Văn A',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'ID: 123456',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Thông tin cá nhân
        _buildSection(
          'Thông tin cá nhân',
          [
            _buildInfoTile(
              icon: Icons.email,
              title: 'Email',
              value: 'example@email.com',
            ),
            _buildInfoTile(
              icon: Icons.phone,
              title: 'Số điện thoại',
              value: '0123456789',
            ),
            _buildInfoTile(
              icon: Icons.location_on,
              title: 'Địa chỉ',
              value: '123 Đường ABC, Quận 1, TP.HCM',
            ),
            _buildInfoTile(
              icon: Icons.calendar_today,
              title: 'Ngày sinh',
              value: '01/01/1990',
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Thông tin học tập
        _buildSection(
          'Thông tin học tập',
          [
            _buildInfoTile(
              icon: Icons.school,
              title: 'Khoa',
              value: 'Công nghệ thông tin',
            ),
            _buildInfoTile(
              icon: Icons.class_,
              title: 'Lớp',
              value: 'SE1234',
            ),
            _buildInfoTile(
              icon: Icons.grade,
              title: 'GPA',
              value: '3.5',
            ),
            _buildInfoTile(
              icon: Icons.assignment_turned_in,
              title: 'Số tín chỉ đã học',
              value: '120',
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Nút chỉnh sửa
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () {
              // TODO: Implement edit profile
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Chỉnh sửa thông tin'),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(value),
    );
  }
} 