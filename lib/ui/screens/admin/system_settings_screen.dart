import 'package:flutter/material.dart';
import '../../../core/models/settings.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình cài đặt hệ thống cho admin
class SystemSettingsScreen extends StatefulWidget {
  const SystemSettingsScreen({super.key});

  @override
  State<SystemSettingsScreen> createState() => _SystemSettingsScreenState();
}

class _SystemSettingsScreenState extends State<SystemSettingsScreen> {
  late Settings _settings;

  @override
  void initState() {
    super.initState();
    _settings = MockDataService.getMockSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Cài đặt chung
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cài đặt chung',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Tên hệ thống: ${_settings.siteName}'),
                  Text('Mô tả: ${_settings.siteDescription}'),
                  Text('Email liên hệ: ${_settings.contactEmail}'),
                  Text('Số điện thoại: ${_settings.contactPhone}'),
                  Text('Địa chỉ: ${_settings.address}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Cài đặt giao diện
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cài đặt giao diện',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: const Text('Chế độ bảo trì'),
                    value: _settings.maintenanceMode,
                    onChanged: (value) {
                      setState(() {
                        _settings = Settings(
                          siteName: _settings.siteName,
                          siteDescription: _settings.siteDescription,
                          contactEmail: _settings.contactEmail,
                          contactPhone: _settings.contactPhone,
                          address: _settings.address,
                          theme: _settings.theme,
                          language: _settings.language,
                          maintenanceMode: value,
                          registrationEnabled: _settings.registrationEnabled,
                          emailNotifications: _settings.emailNotifications,
                          smsNotifications: _settings.smsNotifications,
                        );
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Cho phép đăng ký'),
                    value: _settings.registrationEnabled,
                    onChanged: (value) {
                      setState(() {
                        _settings = Settings(
                          siteName: _settings.siteName,
                          siteDescription: _settings.siteDescription,
                          contactEmail: _settings.contactEmail,
                          contactPhone: _settings.contactPhone,
                          address: _settings.address,
                          theme: _settings.theme,
                          language: _settings.language,
                          maintenanceMode: _settings.maintenanceMode,
                          registrationEnabled: value,
                          emailNotifications: _settings.emailNotifications,
                          smsNotifications: _settings.smsNotifications,
                        );
                      });
                    },
                  ),
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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: const Text('Thông báo qua email'),
                    value: _settings.emailNotifications,
                    onChanged: (value) {
                      setState(() {
                        _settings = Settings(
                          siteName: _settings.siteName,
                          siteDescription: _settings.siteDescription,
                          contactEmail: _settings.contactEmail,
                          contactPhone: _settings.contactPhone,
                          address: _settings.address,
                          theme: _settings.theme,
                          language: _settings.language,
                          maintenanceMode: _settings.maintenanceMode,
                          registrationEnabled: _settings.registrationEnabled,
                          emailNotifications: value,
                          smsNotifications: _settings.smsNotifications,
                        );
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Thông báo qua SMS'),
                    value: _settings.smsNotifications,
                    onChanged: (value) {
                      setState(() {
                        _settings = Settings(
                          siteName: _settings.siteName,
                          siteDescription: _settings.siteDescription,
                          contactEmail: _settings.contactEmail,
                          contactPhone: _settings.contactPhone,
                          address: _settings.address,
                          theme: _settings.theme,
                          language: _settings.language,
                          maintenanceMode: _settings.maintenanceMode,
                          registrationEnabled: _settings.registrationEnabled,
                          emailNotifications: _settings.emailNotifications,
                          smsNotifications: value,
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 