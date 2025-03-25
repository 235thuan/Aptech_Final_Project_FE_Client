import '../models/notification.dart';
import 'mock_data_service.dart';

class NotificationService {
  // Lấy danh sách thông báo
  Future<List<Notification>> getNotifications() async {
    try {
      // TODO: Implement API call
      return MockDataService.getMockNotifications();
    } catch (e) {
      throw Exception('Failed to load notifications: $e');
    }
  }

  // Thêm thông báo mới
  Future<void> addNotification({
    required String title,
    required String content,
    required String type,
    required String priority,
    required List<String> recipients,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to add notification: $e');
    }
  }

  // Cập nhật thông báo
  Future<void> updateNotification({
    required String id,
    required String title,
    required String content,
    required String type,
    required String priority,
    required List<String> recipients,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to update notification: $e');
    }
  }

  // Xóa thông báo
  Future<void> deleteNotification(String id) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to delete notification: $e');
    }
  }
} 