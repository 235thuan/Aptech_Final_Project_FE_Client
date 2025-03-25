import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/settings/settings_bloc.dart';
// import '../../../bloc/settings/settings_event.dart';
// import '../../../bloc/settings/settings_state.dart';
import '../../../core/models/settings.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý cài đặt cho admin
class SettingsManagementScreen extends StatefulWidget {
  const SettingsManagementScreen({super.key});

  @override
  State<SettingsManagementScreen> createState() => _SettingsManagementScreenState();
}

class _SettingsManagementScreenState extends State<SettingsManagementScreen> {
  final _formKey = GlobalKey<FormState>();
  final _siteNameController = TextEditingController();
  final _siteDescriptionController = TextEditingController();
  final _contactEmailController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  final _addressController = TextEditingController();
  bool _maintenanceMode = false;
  bool _registrationEnabled = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  String _selectedTheme = 'light';
  String _selectedLanguage = 'vi';

  @override
  void dispose() {
    _siteNameController.dispose();
    _siteDescriptionController.dispose();
    _contactEmailController.dispose();
    _contactPhoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _showEditSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chỉnh sửa cài đặt'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _siteNameController,
                  decoration: const InputDecoration(labelText: 'Tên trang web'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên trang web';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _siteDescriptionController,
                  decoration: const InputDecoration(labelText: 'Mô tả trang web'),
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mô tả trang web';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _contactEmailController,
                  decoration: const InputDecoration(labelText: 'Email liên hệ'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email liên hệ';
                    }
                    if (!value.contains('@')) {
                      return 'Vui lòng nhập email hợp lệ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _contactPhoneController,
                  decoration: const InputDecoration(labelText: 'Số điện thoại liên hệ'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại liên hệ';
                    }
                    if (value.length < 10) {
                      return 'Vui lòng nhập số điện thoại hợp lệ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Địa chỉ'),
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập địa chỉ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedTheme,
                  decoration: const InputDecoration(labelText: 'Giao diện'),
                  items: const [
                    DropdownMenuItem(value: 'light', child: Text('Sáng')),
                    DropdownMenuItem(value: 'dark', child: Text('Tối')),
                    DropdownMenuItem(value: 'system', child: Text('Theo hệ thống')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedTheme = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedLanguage,
                  decoration: const InputDecoration(labelText: 'Ngôn ngữ'),
                  items: const [
                    DropdownMenuItem(value: 'vi', child: Text('Tiếng Việt')),
                    DropdownMenuItem(value: 'en', child: Text('English')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Chế độ bảo trì'),
                  value: _maintenanceMode,
                  onChanged: (value) {
                    setState(() {
                      _maintenanceMode = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Cho phép đăng ký'),
                  value: _registrationEnabled,
                  onChanged: (value) {
                    setState(() {
                      _registrationEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Thông báo qua email'),
                  value: _emailNotifications,
                  onChanged: (value) {
                    setState(() {
                      _emailNotifications = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Thông báo qua SMS'),
                  value: _smsNotifications,
                  onChanged: (value) {
                    setState(() {
                      _smsNotifications = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: Implement save settings functionality
                Navigator.pop(context);
              }
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng mock data thay vì gọi API
    final mockSettings = MockDataService.getMockSettings();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý cài đặt'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Thông tin trang web
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thông tin trang web',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingItem('Tên trang web', mockSettings.siteName),
                  _buildSettingItem('Mô tả', mockSettings.siteDescription),
                  _buildSettingItem('Email liên hệ', mockSettings.contactEmail),
                  _buildSettingItem('Số điện thoại', mockSettings.contactPhone),
                  _buildSettingItem('Địa chỉ', mockSettings.address),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Cài đặt hệ thống
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cài đặt hệ thống',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingItem('Giao diện', _getThemeText(mockSettings.theme)),
                  _buildSettingItem('Ngôn ngữ', _getLanguageText(mockSettings.language)),
                  _buildSettingItem('Chế độ bảo trì', mockSettings.maintenanceMode ? 'Bật' : 'Tắt'),
                  _buildSettingItem('Cho phép đăng ký', mockSettings.registrationEnabled ? 'Bật' : 'Tắt'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Cài đặt thông báo
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cài đặt thông báo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingItem('Thông báo qua email', mockSettings.emailNotifications ? 'Bật' : 'Tắt'),
                  _buildSettingItem('Thông báo qua SMS', mockSettings.smsNotifications ? 'Bật' : 'Tắt'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Nút chỉnh sửa
          ElevatedButton.icon(
            onPressed: _showEditSettingsDialog,
            icon: const Icon(Icons.edit),
            label: const Text('Chỉnh sửa cài đặt'),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  String _getThemeText(String theme) {
    switch (theme) {
      case 'light':
        return 'Sáng';
      case 'dark':
        return 'Tối';
      case 'system':
        return 'Theo hệ thống';
      default:
        return 'Không xác định';
    }
  }

  String _getLanguageText(String language) {
    switch (language) {
      case 'vi':
        return 'Tiếng Việt';
      case 'en':
        return 'English';
      default:
        return 'Không xác định';
    }
  }
} 