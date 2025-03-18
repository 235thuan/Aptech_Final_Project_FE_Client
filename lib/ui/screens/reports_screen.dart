import 'package:flutter/material.dart';

// Màn hình báo cáo
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Thống kê tổng quan
        _buildOverviewCard(),
        const SizedBox(height: 16),
        // Danh sách báo cáo
        _buildReportsList(),
      ],
    );
  }

  Widget _buildOverviewCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thống kê tổng quan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  icon: Icons.people,
                  label: 'Tổng số học sinh',
                  value: '500',
                ),
                _buildStatItem(
                  icon: Icons.school,
                  label: 'Tổng số giáo viên',
                  value: '50',
                ),
                _buildStatItem(
                  icon: Icons.book,
                  label: 'Tổng số môn học',
                  value: '30',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildReportsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Báo cáo chi tiết',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildReportCard(
          title: 'Báo cáo học tập',
          description: 'Thống kê kết quả học tập của học sinh',
          icon: Icons.grade,
          onTap: () {
            // TODO: Navigate to learning report
          },
        ),
        _buildReportCard(
          title: 'Báo cáo chuyên cần',
          description: 'Thống kê tỷ lệ chuyên cần của học sinh',
          icon: Icons.calendar_today,
          onTap: () {
            // TODO: Navigate to attendance report
          },
        ),
        _buildReportCard(
          title: 'Báo cáo tài chính',
          description: 'Thống kê chi tiêu và thu nhập',
          icon: Icons.attach_money,
          onTap: () {
            // TODO: Navigate to financial report
          },
        ),
        _buildReportCard(
          title: 'Báo cáo hoạt động',
          description: 'Thống kê các hoạt động ngoại khóa',
          icon: Icons.event,
          onTap: () {
            // TODO: Navigate to activity report
          },
        ),
      ],
    );
  }

  Widget _buildReportCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, size: 32, color: Colors.blue),
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
} 