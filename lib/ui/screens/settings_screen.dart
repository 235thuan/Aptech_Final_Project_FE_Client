import 'package:flutter/material.dart';

// Màn hình cài đặt chung cho tất cả người dùng
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Cài đặt tài khoản
        _buildSection(
          'Tài khoản',
          [
            _buildSettingTile(
              icon: Icons.lock,
              title: 'Đổi mật khẩu',
              onTap: () {
                // TODO: Implement password change
              },
            ),
            _buildSettingTile(
              icon: Icons.notifications,
              title: 'Thông báo',
              onTap: () {
                // TODO: Implement notification settings
              },
            ),
            _buildSettingTile(
              icon: Icons.language,
              title: 'Ngôn ngữ',
              onTap: () {
                // TODO: Implement language settings
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Cài đặt bảo mật
        _buildSection(
          'Bảo mật',
          [
            _buildSettingTile(
              icon: Icons.security,
              title: 'Xác thực hai yếu tố',
              onTap: () {
                // TODO: Implement 2FA
              },
            ),
            _buildSettingTile(
              icon: Icons.history,
              title: 'Lịch sử đăng nhập',
              onTap: () {
                // TODO: Implement login history
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Cài đặt chung
        _buildSection(
          'Chung',
          [
            _buildSettingTile(
              icon: Icons.dark_mode,
              title: 'Chế độ tối',
              onTap: () {
                // TODO: Implement dark mode
              },
            ),
            _buildSettingTile(
              icon: Icons.storage,
              title: 'Bộ nhớ',
              onTap: () {
                // TODO: Implement storage management
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Thông tin ứng dụng
        _buildSection(
          'Thông tin',
          [
            _buildSettingTile(
              icon: Icons.info,
              title: 'Phiên bản ứng dụng',
              onTap: () {
                // TODO: Show app version
              },
            ),
            _buildSettingTile(
              icon: Icons.description,
              title: 'Điều khoản sử dụng',
              onTap: () {
                // TODO: Show terms of service
              },
            ),
            _buildSettingTile(
              icon: Icons.privacy_tip,
              title: 'Chính sách bảo mật',
              onTap: () {
                // TODO: Show privacy policy
              },
            ),
          ],
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

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
} 